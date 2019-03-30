#!/bin/sh
# Script para:
# Instalando JavaSlack
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando skype... ... . . . .   .  .  .'

# Instalando slack
snap install slack --classic

# Instalando versao edge do slack
snap install slack --edge --classic

# Atualizando para a ultima versao
snap refresh slack

echo 'Slack install succefull!'
