#!/bin/sh
# Script para:
# Instalacao completa de ambiente de trabalho de servidor linux para desenvolvedores
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======== == -   BEM VINDO AO INSTALADOR DE   - == ========'
echo '======== == - AUTOMATIZAÇÃO  DE  AMBIENTE DE - == ========'
echo '======== == -   DESENVOLVIMENTO EM SERVIDOR  - == ========'
echo '======== == -   --------------------------   - == ========'
echo '======== == -              LINUX             - == ========'
echo '======== == -            VERSÃO 1.0          - == ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======== == - RECOMENDAÇÕES:                 - == ========'
echo '== == - Windows: Via PowerShell ou Git-bash  - == ========'
echo '== == - Download Git-bash for Windows:       - == ========'
echo '== == - Link: https://gitforwindows.org/     - == ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '== == - Linux: Terminal local                - == ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '== == - Tenha um otimo trabalho!!!!          - == ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Instalando wget
apt-get install wget

# Instalando curl
apt-get install curl

# Fazendo conexão com o servidor via ssh
# wget https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/remote-access-ssh.sh

# Configurando rede do servidor
bash ./tmp/scripts-sh/instalador_env/config-network-server.sh

# Instalando ambiente Java
bash ./tmp/scripts-sh/instalador_env/install-java.sh

# Instalando ambiente Maven
bash ./tmp/scripts-sh/instalador_env/install-maven.sh

# Instalando o Apache Tomcat7
bash ./tmp/scripts-sh/instalador_env/install-tomcat.sh

# Instalando ambiente Git
bash ./tmp/scripts-sh/instalador_env/install-git.sh

# Instalando ambiente Docker
bash ./tmp/scripts-sh/instalador_env/install-docker.sh

# Instalando ambiente PostgreSQL
bash ./tmp/scripts-sh/instalador_env/install-docker-postgres.sh

# Instalando ambiente MySQL
bash ./tmp/scripts-sh/instalador_env/install-docker-mysql.sh

# Atualizando senha root do phpMyAdmin
bash ./tmp/scripts-sh/instalador_env/recovery-pass-mysql.sh

# Instalando ambiente Jenkins-client
bash ./tmp/scripts-sh/instalador_env/install-docker-jenkins.sh