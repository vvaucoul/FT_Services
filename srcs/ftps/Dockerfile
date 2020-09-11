# FTPS DOCKERFILE #
FROM alpine:latest
MAINTAINER Vincent Vaucouleur <vvaucoul@student.42.fr>

# GET PACKAGES
RUN apk update
RUN apk add vsftpd
RUN apk add openssl curl

# Telegraf setup
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
COPY ./telegraf.conf /etc/telegraf.conf

# COPY FILES
ADD ./vsftpd.conf		./etc/vsftpd/vsftpd.conf
ADD ./start.sh		./srcs/start.sh
ADD ./livenessprobe.sh	./srcs/livenessprobe.sh
ADD ./ftp.txt /

# CONFIG OPENSSL
RUN openssl req -x509 -nodes -subj \
'/C=FR/ST=PARIS/L=PARIS/O=vvaucoul/CN=localhost' \
-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \
-out /etc/ssl/certs/vsftpd.crt

EXPOSE 20 21 21000-21010

CMD ["sh", "/srcs/start.sh"]
