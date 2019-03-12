#!/bin/sh
# Script para:
# Script de acesso remoto via ssh
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '           BEM VINDO AO ACESSO REMOTO VIA SSH             '
echo '=== = =                                            = = ==='
echo '+========================================================+'

apt install sshpass

# Realizando conexão com ambiente remoto via ssh
echo 'Insira o usuário do ambiente remoto: '
read user_remote

echo 'Insira o ip do ambiente remoto: '
read ip_remote

echo 'Insira a senha do ambiente remoto: '
read pass_remote

ssh $user_remote@$ip_remote
# $pass_remote