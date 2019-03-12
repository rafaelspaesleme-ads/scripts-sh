#!/bin/sh
# Script para:
# Instalacao completa de ambiente de trabalho de servidor linux para desenvolvedores
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Editar 01-netcfg.yaml.
touch /etc/netplan/01-netcfg.yaml
chmod 777 /etc/netplan/01-netcfg.yaml

echo 'Digite o ip fixo: (Ex.: 192.168.0.170)'
read edit_ip_fixo
echo 'Digite o gateway: (Ex.: 192.168.0.1)'
read edit_ip_gateway
echo 'Digite o DNS 1: (Ex.: 8.8.8.8)'
read edit_dns_1
echo 'Digite o DNS 2: (Ex.: 8.8.4.4)'
read edit_dns_2

echo '' >> /etc/netplan/01-netcfg.yaml


