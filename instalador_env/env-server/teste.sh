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
echo -n 'Qual seu sistema operacional local?'
echo -n 'Digite (w) para Windows ou (l) para Linux: '
read resposta
case "$resposta" in
    w|W|"")
        echo "Então tenha um bom almoço =)"
    ;;
     l|W|"")
        echo "Então tenha um bom almoço =)"
    ;;
    *)
        echo "Configura"
    ;;
esac