#!/bin/sh

rm -rf /var/cache/apk/* /etc/my.cnf*

#complete influxdb config
echo "auth-enabled = true" >> /etc/influxdb.conf

#start influxd service
/usr/sbin/influxd &
sleep 5

#create telegraf db to get all metrics
echo "CREATE DATABASE telegraf" | influx
echo "CREATE USER admin WITH PASSWORD 'passwd' WITH ALL PRIVILEGES" | influx

#start telegraf
rm /etc/telegraf.conf && telegraf &

#avoid container to stop
sleep infinity
