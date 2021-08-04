#!/usr/bin/env bash

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
