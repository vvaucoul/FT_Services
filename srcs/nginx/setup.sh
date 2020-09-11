# Nginx starting

USER=admin
PASSWORD=admin

rm -f /var/cache/apk/*

#create admin user for nginx
echo -e "admin\nadmin" | adduser admin

#create necessary directories
mkdir -p /run/nginx /etc/ssl/certs /etc/ssl/private

#move landing page
cp /var/lib/nginx/html/index.html /var/www/index.html

#allow ssh connexion
cd /etc/ssh && ssh-keygen -A

#create ssl credentials
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/CN=localhost"
openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

#start services
rm /etc/telegraf.conf && telegraf &
/usr/sbin/sshd && /usr/sbin/nginx -g 'daemon off;'
