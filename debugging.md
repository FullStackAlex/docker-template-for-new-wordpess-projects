# 502 Bad Gateway
just start php-fpm (how to run on container start?)
# File not found.
https://github.com/nextcloud/docker/issues/398

replace `fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;` in /etc/nginx/conf.d/default.conf to:

`fastcgi_param SCRIPT_FILENAME /var/www/html/$fastcgi_script_name;`

or change `$document_root` to same path as in php-fpm container (`/var/www/html` instead of `/usr/share/nginx/html`)

# php-fpm container hanging all the time  - docker stop/kill not working

Enable "Use gRPC FUSE for file sharing"

Although activated gRPC FUSE doesn't let start the mysql container when using volumes for the data (/var/lib/mysql) :(

# Activated gRPC FUSE doesn't let mysql start with a data volume

[ERROR] [MY-010334] [Server] Failed to initialize DD Storage Engine
[ERROR] [MY-010020] [Server] Data Dictionary initialization failed.
With --verbose:
UnixHTTPConnectionPool(host='localhost', port=None): Read timed out. (read timeout=60)

Solution:
- start container with an empty data volume
- import Database from sql file if there is an existing database
- docker cp project_name_mysql:/var/lib/mysql/. ./mysql/data/
- restart container

https://github.com/docker/compose/issues/3927
https://github.com/docker/for-mac/issues/4957
https://github.com/MariaDB/mariadb-docker/issues/38


Otherwise follow this instruction:

https://stackoverflow.com/questions/64146845/mysql-not-starting-in-a-docker-container-on-macos-after-docker-update

- build the container with an empty folder as mysql data volume (./volumes/mysql/data:/var/lib/mysql)
- import the existing database from a sql file

done.

# DELETE Method get's rejected by nginx (405 not allowed)
???