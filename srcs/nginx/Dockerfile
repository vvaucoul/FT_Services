# NGINX DOCKERFILE #
FROM alpine:latest
MAINTAINER Vincent Vaucouleur <vvaucoul@student.42.fr>

# Update alpine
RUN apk update
RUN apk add nginx --update --no-cache
RUN apk add openssh --update --no-cache
RUN apk add openssl --update --no-cache
RUN apk add openrc --update --no-cache
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk upgrade

# CONFIG OPENSSL
RUN openssl req -x509 -nodes -subj '/C=FR/ST=PARIS/L=PARIS/O=vvaucoul/CN=localhost' \
		 -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/nginx.key \
		 -out /etc/ssl/certs/nginx.crt

ADD telegraf.conf /etc/telegraf/telegraf.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD ssl_params.conf /etc/nginx/ssl_params.conf
ADD setup.sh setup.sh
RUN chmod 757 setup.sh

ADD sshd_config /etc/ssh/

ADD ssh_host_dsa_key /etc/ssh/ssh_host_dsa_key
ADD ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key

RUN chmod 600 /etc/ssh/ssh_host_*

RUN mkdir www
ADD index.html /www/index.html
COPY nginx_website /www/

EXPOSE 22 80 443

ENTRYPOINT sh /setup.sh
