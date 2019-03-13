#!/bin/sh
# Script para:
# Instalacao do ambiente Git
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando ambiente Git
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '=                     Instalando Git                     ='
echo '=== = =                                            = = ==='
echo '+========================================================+'

apt update
apt install git
git --version

# Instalando dependencias do Git
apt update
apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip

cd ~
git clone https://github.com/git/git.git
cd git
make prefix=/usr/local all
make prefix=/usr/local install
git --version

# Configurando usuario git
echo 'Digite seu username do git: '
read user_name_git
echo 'Digite seu email do git: '
read user_mail_git
git config --global user.name "$user_name_git"
git config --global user.email "$user_mail_git"
