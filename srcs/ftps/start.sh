PASSWORD=admin
USER=admin

# Create User & Password with metallb secret
echo -e "$PASSWORD\n$PASSWORD" | adduser -h /srcs/ftp/$USER $USER

#Setup User Folders
mkdir -p /srcs/ftp/$USER
chown $USER:$USER /srcs/ftp/$USER
mkdir /srcs/ftp/$USER/folder_text
chown $USER:$USER /srcs/ftp/$USER/folder_text

# Create template files
mv /ftp.txt /srcs/ftp/$USER/folder_text/ftp.txt

sed -i "s/CLUSTER_IP/localhost/g" /etc/telegraf.conf
export TELEGRAF_CONFIG_PATH="/etc/telegraf.conf"
telegraf &
# start vsftpd
exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21010 -opasv_address=172.17.0.2 \
/etc/vsftpd/vsftpd.conf & tail -f /dev/null
