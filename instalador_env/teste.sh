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

# Criando diretorio local
mkdir instalador_env/seg/
chmod 777 instalador_env/seg/

# Baixando scripts sh
wget -c -r -np -nd --accept=sh -P instalador_env/ https://github.com/rafaelspaesleme-ads/scripts-sh/tree/master/instalador_env/*.sh

# baixando ssh_config
wget -c -r -np -nd -P instalador_env/seg https://github.com/rafaelspaesleme-ads/scripts-sh/tree/master/instalador_env/seg/ssh_config

