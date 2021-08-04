#!/usr/bin/env bash

source /root/.bash_profile
echo "SSH START"
service ssh start

#execute image's original entrypoint script default CMD parameter
#https://github.com/docker-library/mysql/blob/919d1ce067be67fbeb1ff43e82c0a3153160ca28/8.0/Dockerfile.debian
#https://superuser.com/questions/1459466/can-i-add-an-additional-docker-entrypoint-script/1460890
#echo -e "${Purple}EXEC /usr/local/bin/docker-entrypoint.sh 'node'${NC}"
#echo -e "${White} $(cat /usr/local/bin/docker-entrypoint.sh) ${NC}"
#echo -e "${Purple} $(service node status) ${NC}"
#NOT WORKING container stops after exec
#exec /usr/local/bin/docker-entrypoint.sh "node"

#THUS:
#service ssh endany specific process ("shell form" - no arguments from CMD or command line will be applied)
#https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
tail -f /dev/null
