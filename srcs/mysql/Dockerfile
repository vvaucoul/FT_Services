# NGINX DOCKERFILE #
FROM alpine:latest
MAINTAINER Vincent Vaucouleur <vvaucoul@student.42.fr>

# Update alpine
RUN apk update
RUN apk add mysql mysql-client --update --no-cache
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk upgrade

COPY telegraf.conf /etc/telegraf/
COPY my.cnf /etc/mysql/
COPY wordpress.sql /
COPY start.sh /

ENTRYPOINT sh start.sh

EXPOSE 3306
