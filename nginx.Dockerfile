FROM nginx:latest

RUN apt update
RUN apt upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y ssh

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales  --fix-missing

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8


COPY ./shell/init/init_nginx.sh /root/setup/init.sh
COPY ./shell/init/ssl.sh /root/setup/ssl.sh
COPY ./shell/entrypoints/nginx.sh /root/setup/entrypoint.sh
RUN chmod +x /root/setup/*
RUN /root/setup/init.sh
RUN /root/setup/ssl.sh

ENTRYPOINT /root/setup/entrypoint.sh