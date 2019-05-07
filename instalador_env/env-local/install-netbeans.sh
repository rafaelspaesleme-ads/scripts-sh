#!/bin/sh
# Script para:
# Instalando netbeans
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando e configurando netbeans... ... . . . .   .  .  .'

# Download do Netbeans
apt -y install wget unzip
wget https://www-us.apache.org/dist/incubator/netbeans/incubating-netbeans/incubating-10.0/incubating-netbeans-10.0-bin.zip

# Descompactando netbeans
unzip incubating-netbeans-10.0-bin.zip

# Movendo para pasta opt
mv netbeans/ /opt/

# Configurando arquivo para executar netbeans
nano ~/.bashrc
export PATH="$PATH:/opt/netbeans/bin/"
source ~/.bashrc

nano ~/.zshrc
export PATH="$PATH:/opt/netbeans/bin/"
source ~/.zshrc

echo 'NetBeans 10 install succefull!'
