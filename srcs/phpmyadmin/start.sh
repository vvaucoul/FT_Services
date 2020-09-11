#!/bin/sh

rm -f /var/cache/apk/*

#start services
rm /etc/telegraf.conf && telegraf &
php -S 0.0.0.0:5000 -t /www/phpmyadmin
