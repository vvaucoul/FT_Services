#!/bin/sh

rm -rf /var/cache/apk/* /etc/my.cnf*

#start services
rm /etc/telegraf.conf && telegraf &
/usr/sbin/grafana-server
