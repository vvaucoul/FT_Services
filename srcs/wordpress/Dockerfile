# NGINX DOCKERFILE #
FROM alpine:latest
MAINTAINER Vincent Vaucouleur <vvaucoul@student.42.fr>

# Update alpine
RUN apk update
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session --update --no-cache
RUN apk add telegraf --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk upgrade

# Download wordpress
RUN mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN wget https://downloads.wordpress.org/theme/hestia.3.0.4.zip && unzip hestia.3.0.4.zip
RUN cp -rf hestia wordpress/wp-content/themes/hestia/ && rm hestia.3.0.4.zip && rm -rf hestia
RUN mkdir -p /var/www && mv /wordpress /var/www/

# Copy local files
COPY telegraf.conf /etc/telegraf/
COPY wp-config.php /var/www/wordpress/
COPY start.sh /

EXPOSE 5050

ENTRYPOINT sh start.sh
