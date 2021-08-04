FROM php8-fpm-basis
#see https://github.com/Tech-Nomad/docker-php8-fpm-basis

#needed for wp-cli
#but as php is using debian instead of ubuntu there is no mysql-client package, instead:
RUN apt-get install -y mariadb-client
#https://stackoverflow.com/a/57049357/4721232
#maybe the default-mysql-client package is fine too...

#run the install-wp script manually as you can't run it from the init.sh because the mysql container isn't running at this time
COPY ./shell/init/install-wp.sh /root/setup/install-wp.sh
COPY ./shell/init/init_php.sh /root/setup/init.sh
COPY ./shell/entrypoints/php.sh /root/setup/entrypoint.sh
RUN chmod +x /root/setup/*
RUN /root/setup/init.sh

ENTRYPOINT /root/setup/entrypoint.sh
