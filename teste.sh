#!/bin/bash
# Ask the user for their name
# Verificando qual IP do jenkins
ifconfig -a 

# Insira o ip do jenkins
echo 'Insira o IP do jenkins: '
read host_ip_jenkins

# Abrindo url do jenkins
xdg-open http://$host_ip_jenkins:8080

docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1  -o parent=eth0 pub_net