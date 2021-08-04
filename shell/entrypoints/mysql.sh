#!/usr/bin/env bash

source /root/.bash_profile

service ssh start

#https://github.com/docker-library/mysql/blob/919d1ce067be67fbeb1ff43e82c0a3153160ca28/8.0/Dockerfile.debian
#https://superuser.com/questions/1459466/can-i-add-an-additional-docker-entrypoint-script/1460890
exec /usr/local/bin/docker-entrypoint.sh "mysqld" "--default-authentication-plugin=mysql_native_password"
