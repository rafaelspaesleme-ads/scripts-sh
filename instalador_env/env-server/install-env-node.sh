#!/bin/bash
# Script para:
# Escolha de criação de ambiente para desenvolvimento node.js
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando pacote curl
apt-get install curl

# Instalando node de acordo com a versão desejada
version_node=$( dialog --title 'VERSÃO NODE.JS' --stdout --inputbox 'Qual o número da sua versão node\n\nVersão nº.: ' 0 0 )
curl -sL https://deb.nodesource.com/setup_$version_node.x | sudo -E bash –
apt-get install -y nodejs

