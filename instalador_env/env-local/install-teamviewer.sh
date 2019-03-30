#!/bin/sh
# Script para:
# Instalando teamviewer
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando TeamViewer... ... . . . .   .  .  .'

# Baixando versoes do teamview
wget https://download.teamviewer.com/download/linux/teamviewer_i386.deb -O teamviewer.deb
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O teamviewer.deb

# Instalando teamviewer
dpkg -i teamviewer.deb

# Intalando dependencias
apt-get install -f -y

echo 'TeamViewer install succefull!'

