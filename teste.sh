#!/bin/bash
# Ask the user for their name
# Verificando qual IP do jenkins
ifconfig -a 

# Insira o ip do jenkins
echo 'Insira o IP do jenkins: '
read host_ip_jenkins

# Abrindo url do jenkins
xdg-open http://$host_ip_jenkins:8080
