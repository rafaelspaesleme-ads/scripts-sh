#!/bin/sh
# Script para:
# Configurando rede fixa do servidor
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======== == -   CONFIGURAÇÃO DE REDE FIXA -    == ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Iniciando configuração de rede.
dialog --title "CONFIGURAÇÃO DE REDE FIXA" \
--backtitle "Deseja configurar sua rede manualmente? " \
resposta=$?
case "$resposta" in
    0)
    
        touch 01-netcfg.yaml
        chmod 777 01-netcfg.yaml

        edit_ip_fixo=$( dialog --stdout --inputbox 'Digite o ip fixo: (Ex.: 192.168.0.170)' 0 0 )
        edit_ip_gateway=$( dialog --stdout --inputbox 'Digite o gateway: (Ex.: 192.168.0.1)' 0 0 )
        edit_dns_1=$( dialog --stdout --inputbox 'Digite o DNS 1: (Ex.: 8.8.8.8)' 0 0 )
        edit_dns_2=$( dialog --stdout --inputbox 'Digite o DNS 2: (Ex.: 8.8.4.4)' 0 0 )

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

        mv 01-netcfg.yaml /etc/netplan/

        netplan apply

    ;;
    1)
        echo 'Configuração manual cancelada.'
    ;;
esac