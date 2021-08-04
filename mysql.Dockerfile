FROM mysql:8

RUN apt update
RUN apt upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y ssh
RUN apt-get install -y dialog
RUN apt-get install -y less
RUN apt-get install -y expect


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales  --fix-missing

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

COPY ./shell/init/init_mysql.sh /root/setup/init.sh
COPY ./shell/entrypoints/mysql.sh /root/setup/entrypoint.sh
RUN chmod +x /root/setup/*
RUN chmod +x /root/setup/*
RUN /root/setup/init.sh

ENTRYPOINT /root/setup/entrypoint.sh