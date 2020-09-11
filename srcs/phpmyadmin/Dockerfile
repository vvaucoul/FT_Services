# NGINX DOCKERFILE #
FROM alpine:latest
MAINTAINER Vincent Vaucouleur <vvaucoul@student.42.fr>

# Update alpine
RUN apk update
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session --update --no-cache
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk upgrade

# Download phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz
RUN mkdir -p /www && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

# Copy local files
COPY telegraf.conf /etc/telegraf/
COPY config.inc.php /www/phpmyadmin/
COPY start.sh /

ENTRYPOINT sh start.sh

EXPOSE 5000
