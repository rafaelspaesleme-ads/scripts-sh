#!/bin/bash
# Ask the user for their name
# Verificando qual IP do jenkins
# ifconfig -a 

# Insira o ip do jenkins
# echo 'Insira o IP do jenkins: '
# read host_ip_jenkins

# Abrindo url do jenkins
# xdg-open http://$host_ip_jenkins:8080

# docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1  -o parent=eth0 pub_net
# wget https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/01-netcfg.yaml

# Instalando wget
apt-get install wget

# Instalando curl
apt-get install curl

# Instalando git
apt-get install git

# Baixando scripts sh
git clone https://github.com/rafaelspaesleme-ads/scripts-sh.git
chmod -R 777 scripts-sh

# transferencia de dados local para servidor
sshpass -p "z0612c" scp -r scripts-sh/ zaal@192.168.0.91:/tmp 