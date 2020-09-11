#!/bin/sh

#start services
rm /etc/telegraf.conf && telegraf &
php -S 0.0.0.0:5050 -t /var/www/wordpress/
