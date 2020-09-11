# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vvaucoul <vvaucoul@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/05 16:32:02 by vvaucoul          #+#    #+#              #
#    Updated: 2020/09/10 16:03:47 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### Colors ###
Red="\e[31m"
Green="\e[32m"
Yellow="\e[33m"
Orange="\e[38;5;202m"
Blue="\e[34m"
Default="\e[39;0m"
Bold="\e[39;1m"

### SETUP FT_SERVICES ###

### Start Minikube Linux/MAC ###

echo $Bold$Green"
  _____ _____   ____  _____ ______     _____ ____ _____ ____
 |  ___|_   _| / ___|| ____|  _ \ \   / /_ _/ ___| ____/ ___|
 | |_    | |   \___ \|  _| | |_) \ \ / / | | |   |  _| \___ \\
 |  _|   | |    ___) | |___|  _ < \ V /  | | |___| |___ ___) |
 |_|     |_|   |____/|_____|_| \_\ \_/  |___\____|_____|____/

                                  $Bold$Yellow      by vvaucoul
                                  $Bold$Orange      Launch it on linux VM
"

echo $Bold$Green"\n➜ Starting Minikube\n"$Default
minikube config unset vm-driver
minikube config unset driver
minikube --vm-driver=docker start --kubernetes-version=v1.18.8 --extra-config=apiserver.service-node-port-range=1-35000

### Start Minikube Linux ### ### Uncomment for linux user
#minikube --vm-driver=virtualbox start --kubernetes-version=v1.18.8 --extra-config=apiserver.service-node-port-range=1-35000

# link Minikube with docker daemon
eval $(minikube docker-env)

### Minikube Addons ###
echo $Bold$Yellow"\n➜ Enabling Minikube Addons (metrics-server / ingress / Dashboard)\n"$Default
minikube addons enable metrics-server > /dev/null
minikube addons enable ingress > /dev/null
minikube addons enable dashboard > /dev/null

### Sore Minikube IP ###
MINIKUBE_IP=$(minikube ip)
echo $Bold$Green"➜ Got Minikube IP [$MINIKUBE_IP]"$Default

### DASHBOARD TOKEN ###
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') > /dev/null

echo $Bold$Yellow"➜ Apply IP range"$Default
sed -i 's/192.168.99/172.17.0/g' srcs/ftps/start.sh > /dev/null
sed -i 's/192.168.99/172.17.0/g' srcs/metallb.yaml > /dev/null
sed -i 's/192.168.99/172.17.0/g' srcs/mysql/wordpress.sql > /dev/null

#setup metalLB secret
# Create a secret for encrypted speaker communications
echo $Bold$Green"➜ Install MetalLB"$Default
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null

### Build dockerFiles ###
echo $Bold$Blue"➜ Building docker images"$Default
echo $Bold$Blue"🐋 FT_Nginx"$Default
docker build -t ft_nginx srcs/nginx --build-arg IP=${IP} > /dev/null
echo $Bold$Blue"🐋 FT_FTPS"$Default
docker build -t ft_ftps srcs/ftps > /dev/null
echo $Bold$Blue"🐋 FT_Grafana"$Default
docker build -t ft_grafana srcs/grafana > /dev/null
echo $Bold$Blue"🐋 FT_PHPMyAdmin"$Default
docker build -t ft_phpmyadmin srcs/phpmyadmin > /dev/null
echo $Bold$Blue"🐋 FT_Wordpress"$Default
docker build -t ft_wordpress srcs/wordpress > /dev/null
echo $Bold$Blue"🐋 FT_INfluxDB"$Default
docker build -t ft_influxdb srcs/influxdb > /dev/null
echo $Bold$Blue"🐋 FT_Grafana"$Default
docker build -t ft_grafana srcs/grafana > /dev/null
echo $Bold$Blue"🐋 FT_MySQL"$Default
docker build -t ft_mysql srcs/mysql > /dev/null

### Use .yaml files ###
echo $Bold$Orange"\n➜ Loading services config"$Default
kubectl apply -f srcs > /dev/null

echo $Bold$Yellow"\n➜ Open : $MINIKUBE_IP"$Default
sleep 1
echo $Bold$Orange"\n➜ Service list : \n"$Default
sleep 2

echo -n $Bold$Green "NGINX $Default \t| user : admin\t password : admin\tIP : http://"
kubectl get svc | grep nginx-service | cut -d " " -f 15,16,17 | tr -d "\n" | tr -d " "
echo ":80 (443 for https)"
echo -n $Bold$Blue "WORDPRESS $Default \t| user : admin\t password : passwd\tIP : http://"
kubectl get svc | grep wordpress-service | cut -d " " -f 11,12,13 | tr -d "\n" | tr -d " "
echo ":5050"
echo -n $Bold$Red "FTPS $Default \t\t| user : admin\t password : admin\tIP : "
echo -n "ftp://"
kubectl get svc | grep ftps-service | cut -d " " -f 15,16,17,18 | tr -d "\n" | tr -d " "
echo ":21"
echo -n $Bold$Orange "GRAFANA $Default \t| user : admin\t password : passwd\tIP : http://"
kubectl get svc | grep grafana-service | cut -d " " -f 13,14,15 | tr -d "\n" | tr -d " "
echo ":3000"
echo -n $Bold$Yellow "PHPMYADMIN $Default \t| user : admin\t password : passwd\tIP : http://"
kubectl get svc | grep phpmyadmin-service | cut -d " " -f 10,11,12,13 | tr -d "\n" | tr -d " "
echo ":5000"

sleep 1

### Instructions ###
echo $Bold$Orange"Instructions :\n"$Default
echo $Bold"NGINX - WORDPRESS - GRAFANA - PHPMYADMIN : Open ip http"$Default
echo $Bold"NGINX SSH : ssh admin@IP password : admin"$Default
echo $Bold"FTPS : use filezila to get ssl sertificate\n"$Default

### Dashboard Minikube ###
echo $Bold$Green"\n➜ Starting Dashboard"$Default
kubectl proxy &
minikube dashboard &
