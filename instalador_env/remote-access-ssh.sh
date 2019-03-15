#!/bin/sh
# Script para:
# Script de acesso remoto via ssh personalizado
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '           BEM VINDO AO ACESSO REMOTO VIA SSH             '
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Iniciando configuração de rede.
echo 'Qual seu sistema operacional?'
echo 'Digite (w) para Windows ou (l) para linux: '
read sisoperation

    if [[ $sisoperation == "l" || $sisoperation == "L" ]]; then

        # Realizando conexão com ambiente remoto via ssh
        echo 'Insira o usuário do ambiente remoto: '
        read user_remote_linux

        echo 'Insira o ip do ambiente remoto: '
        read ip_remote_linux

        echo 'Insira a senha do ambiente remoto: '
        read pass_remote

        # Instalando scp
        apt-get install scp

        # Instalando ssh
        apt-get install ssh

        # Instalando o controlador de password
        apt install sshpass

        # configurando ssh_config
        wget https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/seg/ssh_config

        chmod 777 /etc/ssh/ssh_config

        mv -f ssh_config /etc/ssh/

        # Instalando wget
        apt-get install wget

        # Instalando curl
        apt-get install curl

        # Instalando git
        apt-get install git

        # Baixando scripts sh
        git clone https://github.com/rafaelspaesleme-ads/scripts-sh.git
        chmod -R 777 scripts-sh

        # transferencia de dados local para servidor
        sshpass -p "$pass_remote" scp -r scripts-sh/instalador_env/install-docker-env-dev-server-full.sh $user_remote_linux@$ip_remote_linux: 
        sshpass -p "$pass_remote" scp -r scripts-sh/ $user_remote_linux@$ip_remote_linux:/tmp 

        rm -R scripts-sh/

        # executando comando via ssh echo -e "$1\n" | sudo su -S
        sshpass -p "$pass_remote" ssh $user_remote@$ip_remote

    else

        # Realizando conexão com ambiente remoto via ssh
        echo 'Insira o usuário do ambiente remoto: '
        read user_remote_win

        echo 'Insira o ip do ambiente remoto: '
        read ip_remote_win

        # Baixando scripts sh
        git clone https://github.com/rafaelspaesleme-ads/scripts-sh.git
        chmod -R 777 scripts-sh

        # transferencia de dados local para servidor
        scp -r scripts-sh/instalador_env/install-docker-env-dev-server-full.sh $user_remote_win@$ip_remote_win: 
        scp -r scripts-sh/ $user_remote_win@$ip_remote_win:/tmp 

        # executando comando via ssh echo -e "$1\n" | sudo su -S
        ssh $user_remote_win@$ip_remote_win

    fi