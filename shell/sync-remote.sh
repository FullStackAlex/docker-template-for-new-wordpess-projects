#!/usr/local/bin/bash
#1. dump database
#2. rsync files
#3. import db on remote via ssh command
#4. TODO accept one parameter (db|all). Default (no parameters) syncs only the files
source ~/.bash_profile
docker exec wordpress_mysql sh -c "mysqldump wordpress >  /root/wordpress.sql"
docker cp wordpress_mysql:/root/wordpress.sql ./mysql/dumps/
cd /path/to/project/on/your/host/machine/wordpress/
rsync -a --progress php/app/  remote@host:/home/wordpress/html
scp mysql/dumps/wordpress.sql  remote@host:/home/wordpress/mysql_dumps/wordpress.sql
ssh remote@host "mysql -uwordpress -pwordpress wordpress < /home/wordpress/mysql_dumps/wordpress.sql"
ssh remote@host "sed -i 's/wordpress_mysql/localhost/g' /home/wordpress/html/wp-config.php"
ssh remote@host "cd /home/wordpress/html/ && wp search-replace //docker.wordpress //wordpress.tech-nomad.de"
