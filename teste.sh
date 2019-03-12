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
apt update
apt install git
git --version

# Instalando dependencias do Git
apt update
apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip

cd ~
git clone https://github.com/git/git.git
cd git
make prefix=/usr/local all
make prefix=/usr/local install
git --version

# Configurando usuario git
echo 'Digite seu username do git: '
read user_name_git
echo 'Digite seu email do git: '
read user_mail_git
git config --global user.name "$user_name_git"
git config --global user.email "$user_mail_git"