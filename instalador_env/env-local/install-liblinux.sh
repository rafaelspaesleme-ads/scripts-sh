#!/bin/sh
# Script para:
# Instalando dos pacotes do linux
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando pacotes
apt-get install

# Atualizando pacotes
apt-get update
apt-get upgrade

# Instalando wget
apt install wget

# Instalando git
apt install git

# Instalando curl
apt install curl

# Instalando zsh
apt install zsh

# Instalando nano
apt install nano

# Instalando vim
apt-get install vim

# Instalando gedit
apt-add-repository ppa:mc3man/older
apt update && apt install gedit gedit-plugins gedit-common
ppa-purge ppa:mc3man/older

# Instalando bleachbit
apt install bleachbit

# Instalando o snap
apt install snap

# Atualizando pacotes
apt-get update
apt-get upgrade

# Instalando openssh
apt install -y openssh-server
systemctl start ssh

# Instalando sshpass
apt install sshpass

# Instalando htop
apt-get install htop

# Atualizando pacotes
apt-get update
apt-get upgrade

# Instalando pacte node completo
apt install nodejs npm
apt install npm
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
apt install nodejs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install node

# Limpando pacotes desnecessarios
apt-get clean

# Atualizando pacotes
apt-get update
apt-get upgrade

