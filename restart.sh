sh tools/fast_clean.sh
docker build -t ft_nginx srcs/nginx > /dev/null
docker build -t ft_ftps srcs/ftps > /dev/null
docker build -t ft_grafana srcs/grafana > /dev/null
docker build -t ft_phpmyadmin srcs/phpmyadmin > /dev/null
docker build -t ft_wordpress srcs/wordpress > /dev/null
docker build -t ft_influxdb srcs/influxdb > /dev/null
docker build -t ft_grafana srcs/grafana > /dev/null
docker build -t ft_mysql srcs/mysql > /dev/null
sh setup.sh
