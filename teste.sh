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
touch 01-netcfg.yaml
chmod 777 01-netcfg.yaml

echo 'Digite o ip fixo: (Ex.: 192.168.0.170)'
read edit_ip_fixo
echo 'Digite o gateway: (Ex.: 192.168.0.1)'
read edit_ip_gateway
echo 'Digite o DNS 1: (Ex.: 8.8.8.8)'
read edit_dns_1
echo 'Digite o DNS 2: (Ex.: 8.8.4.4)'
read edit_dns_2

echo "--- " >> 01-netcfg.yaml
echo "network: " >> 01-netcfg.yaml
echo "  ethernets: " >> 01-netcfg.yaml
echo "    enp0s8: " >> 01-netcfg.yaml
echo "      addresses: " >> 01-netcfg.yaml
echo "        - $edit_ip_fixo/24" >> 01-netcfg.yaml
echo "      dhcp4: false" >> 01-netcfg.yaml
echo "      dhcp6: false" >> 01-netcfg.yaml
echo "      gateway4: \"$edit_ip_gateway\"" >> 01-netcfg.yaml
echo "      nameservers: " >> 01-netcfg.yaml
echo "        addresses: " >> 01-netcfg.yaml
echo "          - \"$edit_dns_1\"" >> 01-netcfg.yaml
echo "          - \"$edit_dns_2\"" >> 01-netcfg.yaml
echo "    ens32: " >> 01-netcfg.yaml
echo "      dhcp4: true" >> 01-netcfg.yaml
echo "  renderer: networkd" >> 01-netcfg.yaml
echo "  version: 2" >> 01-netcfg.yaml

mv 01-netcfg.yaml teste/