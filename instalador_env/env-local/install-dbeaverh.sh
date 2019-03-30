#!/bin/sh
# Script para:
# Instalando dbeaverh
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando DBeaverh... ... . . . .   .  .  .'

# Adicionando o repositorio do programa
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

# Baixando e importando chave do repositorio
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -

# Autalizando pacotes
apt-get update

# Instalando o programa
apt-get install dbeaver-ce

echo 'DBeaverh install succefull!'