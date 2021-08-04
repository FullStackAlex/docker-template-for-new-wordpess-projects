#!/usr/bin/env bash

source /root/.bash_profile
service nginx start
service ssh start

#service ssh endany specific process ("shell form" - no arguments from CMD or command line will be applied)
#https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
tail -f /dev/null