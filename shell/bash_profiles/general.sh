#!/usr/bin/env bash

project_name="wordpress"

source /root/terminal-coloring.sh

app=/home/node/app/
cd_app(){
  cd $app
}
blog(){
  cd /var/www/html/wp-content/plugins/wue-blog
}
theme(){
  cd /var/www/html/wp-content/themes/wue-basic-theme
}



start(){
  cd_app
  npm run start-$1
}
startfrontend(){
  cd_app
  npm run start-$1-frontend
}

startbackend(){
  cd_app
  npm run start-$1-backend
}
build(){
  cd_app
  npm run build-$1
}

buildfrontend(){
  cd_app
  npm run build-$1-frontend
}

buildbackend(){
  cd_app
  npm run build-$1-backend
}

buildproductionfrontend(){
  cd_app
  npm run build-for-production-$1-frontend
}




colored() {
  color='\033[0m' # No Color
  nocolor='\033[0m' # No Color
  case "$1" in
  "red") color='\033[0;31m' ;;
  "green") color='\033[0;32m' ;;
  "brown") color='\033[0;33m' ;;
  "blue") color='\033[1;34m' ;;
  "purple") color='\033[0;35m' ;;
  "cyan") color='\033[0;36m' ;;
  "gray") color='\033[0;37m' ;;
  esac
  echo "${color}${2}${nocolor}\n"
}

sourceprofile() {
  source /root/.bash_profile
}

nginx_error_log() {
  cat /var/log/nginx/error.log | less
}

nginx_access_log() {
  cat /var/log/nginx/access.log | less
}

list_top_directories_and_files_by_size(){
  du -Sh | sort -rh | head -${1:-5}
}


find_files_by_string() {
  # $1 - directory
  # $2 - string
  # $3 - filename pattern
  # grep -l or ‘--files-with-matches’: Suppress normal output; instead print the name of each input file from which output would normally have been printed.
  find $1 -name ${3:-"**.*"} -exec grep -lr $2 {} +
}

find_in_history() {
  history | grep $1 | less
}

my_grep() {
  #https://stackoverflow.com/a/16957078/4721232
  # -r or -R is recursive,
  # -n is line number, and
  # -w stands for match the whole word.
  # -l (lower-case L) can be added to just give the file name of matching files.
  # Along with these, --exclude, --include, --exclude-dir flags could be used for efficient searching:
  #
  # This will only search through those files which have .c or .h extensions:
  # grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
  # This will exclude searching all the files ending with .o extension:
  # grep --exclude=*.o -rnw '/path/to/somewhere/' -e "pattern"
  # For directories it's possible to exclude a particular directory(ies) through --exclude-dir parameter. For example, this will exclude the dirs dir1/, dir2/ and all of them matching *.dst/:
  # grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"
  # This works very well for me, to achieve almost the same purpose like yours.
  #
  # For more options check man grep.

  # https://stackoverflow.com/a/30138655/4721232
  #-i - Insensitive searching.
  #-I - Ignore the binary files.
  #-w - Search for the whole words (in opposite of partial word matching).
  #-n - Show the line of your match.
  #-C/--context (e.g. -C5) - Increases context, so you see the surrounding code .
  #--color=auto - Mark up the matching text.
  #-H - Displays filename where the text is found.
  #-c - Displays count of matching lines. Can be combined with -H.
  #-h, --no-filename
  #     Suppress the prefixing of file names on output. This is the default
  #     when there is only  one  file  (or only standard input) to search.

  #$1 - string
  #$2 - path
  #$3 - number of context lines
  #$4 - additional conditions
  grep -rnw${4:- } -C${3:-3} ${2:-./} -e $1
}

find_last_edited ()
{
    wildcard=${1:-*.*};
    minutes=${2:-1440};
    path=${3:-./};
    type=${4:-f};
    unit=${5:-min};
    find $path -name "$wildcard" -type $type -m$unit -$minutes -ls
}
html(){
  cd /var/www/html
}
Black="\033[0;30m"
DarkGray="\033[1;30m"
Red="\033[0;31m"
LightRed="\033[1;31m"
Green="\033[0;32m"
LightGreen="\033[1;32m"
BrownOrange="\033[0;33m"
Yellow="\033[1;33m"
Blue="\033[0;34m"
LightBlue="\033[1;34m"
Purple="\033[0;35m"
LightPurple="\033[1;35m"
Cyan="\033[0;36m"
LightCyan="\033[1;36m"
LightGray="\033[0;37m"
White="\033[1;37m"
RED="\033[0;31m"
NC="\033[0m" # No Color

#https://github.com/wp-cli/wp-cli/issues/4548
alias wp='wp --allow-root'

#############
# Alacritty #
#############
if [ "$(uname -s)" = "Linux" ]; then
  alias ls='ls -Fh --color=auto'
fi

export TERM=xterm-256color

#https://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
#without last part of the path (W instead of w):
export PS1="\[\033[38;5;48m\]\u\[\033[38;5;49m\]@\[\033[00;38;5;50m\]\h:\[\033[38;5;51m\]\W/\[\033[38;5;87m\]\$ \[\033[0m\]"
export CLICOLOR=1

#coloring bsd ls
#https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
#export LSCOLORS=GxGxGxGxGxegedabagacad
#or:
#alias ls='LSCOLORS=gxfxcxdxbxexexabagacad /bin/ls -bFHGLOPW'


#Coloring gnu ls
#LS_COLORS (GNU) not working on macOS by default (needs gnu coreutils being installed and bsd ls replaced by gnu ls):
file="38;5;231"
directory="01;38;5;45"
link="04;38;5;33"
image="38;5;163"
executable="38;5;161" #ex=$executable
shell="01;38;5;46"
archive="1;38;5;81"
log="38;5;190"
multihardlink="00"
namedpipe="40;33"
socket="01;35"
door="01;35"
reset="0"
blockdevice="40;33;01"
characterdevice="40;33;01"
orphan="40;31;01" #Symbolic link pointing to a non-existent file
missing="00" #	Non-existent file pointed to by a symbolic link (visible when you type ls -l)
setuid="37;41" #File that is setuid (u+s)
setgid="30;43" # File that is setgid (g+s)
sticky_other_writable="30;42" #Directory that is sticky and other-writable (+t,o+w)
other_writable="34;42" # Directory that is other-writable (o+w) and not sticky
sticky="37;44" # Directory with the sticky bit set (+t) and not other-writable

export LS_COLORS="fi=$file:rs=$reset:di=$directory:ln=$link:ex=$executable:mh=$multihardlink:pi=$namedpipe:so=$socket:do=$door:bd=$blockdevice:cd=$characterdevice:or=$orphan:mi=$missing:su=$setuid:sg=$setgid:ca=30;41:tw=$sticky_other_writable:ow=$other_writable:st=$sticky:*.sh=$shell:*.log=$log:*.tar=$archive:*.tgz=$archive:*.zip=$archive:*.gz=$archive:*.jar=$archive:*.rar=$archive::*.jpg=$image:*.jpeg=$image:*.mjpg=$image:*.mjpeg=$image:*.gif=$image:*.bmp=$image:*.tif=$image:*.tiff=$image:*.png=$image:*.svg=$image:*.svgz=$image"


#further info on LS_COLORS
#http://www.bigsoft.co.uk/blog/2008/04/11/configuring-ls_colors
#https://askubuntu.com/questions/17299/what-do-the-different-colors-mean-in-ls

#rs stands for reset
#https://lists.gnu.org/archive/html/coreutils/2018-05/msg00030.html

#from https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_md=$'\E[1;38;5;124m' # begin blink / Titles and description
export LESS_TERMCAP_mb=$'\E[1;43;35m'      # begin bold / no effect in man pages
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;04;07m' # search selection (bold, inverse, underline)
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;04;38;5;231m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#no effect in man pages:
#export LESS_TERMCAP_sg=$'\E[1;43;35m'
#export LESS_TERMCAP_ms=$'\E[1;43;35m'
#export LESS_TERMCAP_xs=$'\E[1;43;35m'
#export LESS_TERMCAP_xt=$'\E[1;43;35m'
#export LESS_TERMCAP_mh=$'\E[1;43;35m'
#export LESS_TERMCAP_mk=$'\E[1;43;35m'
#export LESS_TERMCAP_mp=$'\E[1;43;35m'
#export LESS_TERMCAP_mr=$'\E[1;43;35m'
#export LESS_TERMCAP_as=$'\E[1;43;35m'
#export LESS_TERMCAP_ae=$'\E[1;43;35m'
#export LESS_TERMCAP_sa=$'\E[1;43;35m'

now(){
  date +"%T"
}

