#!/bin/sh
# Script para:
# Instalando Skype
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando skype... ... . . . .   .  .  .'

# Baixando repositorio do Skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb -O skype.deb

# Instalando skype
dpkg -i skype.deb

# Instalando dependencias
apt-get install -f

echo 'Skype install succefull!'