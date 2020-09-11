# NGINX DOCKERFILE #
FROM alpine:latest
MAINTAINER Vincent Vaucouleur <vvaucoul@student.42.fr>

# Update alpine
RUN apk update
RUN apk add grafana --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk upgrade

WORKDIR /usr/share/grafana

COPY telegraf.conf /etc/telegraf/
COPY grafana.db /usr/share/grafana/data/
COPY start.sh /

ENTRYPOINT sh /start.sh

EXPOSE 3000
