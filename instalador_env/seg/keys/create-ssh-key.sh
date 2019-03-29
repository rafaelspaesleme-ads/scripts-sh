#!/bin/sh
# Script para:
# Script de criacao de chave ssh
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

apt-get install openssh-server

ssh-keygen -t rsa

