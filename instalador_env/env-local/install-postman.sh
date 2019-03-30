#!/bin/sh
# Script para:
# Instalando Postman
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando e configurando postman... ... . . . .   .  .  .'

# Instalando postman
snap install postman

# Instalando versao edge
snap install postman --edge

# Atualizando para a versao mais recente
snap refresh postman

echo 'Postman install succefull!'