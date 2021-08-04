#!/bin/sh

. /root/.bash_profile

service ssh start
php-fpm

#start without any specific process ("shell form" - no arguments from CMD or command line will be applied)
#https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
tail -f /dev/null