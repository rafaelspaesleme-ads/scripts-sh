#!/bin/sh
# Script para:
# Instalando vscode
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando VSCode... ... . . . .   .  .  .'

# Atualizando pacotes
apt-get update

# Instalando snapd
apt-get install snapd snapd-xdg-open

# Instalando vscode
snap install --classic vscode

# atualizando para a versao mais recente
snap refresh vscode