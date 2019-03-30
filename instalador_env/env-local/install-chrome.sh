#!/bin/sh
# Script para:
# Instalando google chrome
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando Google Chrome... ... . . . .   .  .  .'

# Adicionando repositorio do Chrome
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Baixando e importando chave do repositorio
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Atualizando pacotes
apt-get update

# Instalando o chrome
apt-get install google-chrome-stable

echo 'Install succefull!'