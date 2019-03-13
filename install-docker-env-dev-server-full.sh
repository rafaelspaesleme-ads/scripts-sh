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

# Instalando curl
apt install curl

# Fazendo conexão com o servidor via ssh
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/remote-access-ssh.sh | sh

# Configurando rede do servidor
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/config-network-server.sh | sh

# Instalando ambiente Java
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-java.sh | sh

# Instalando ambiente Maven
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-maven.sh | sh

# Instalando o Apache Tomcat7
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-tomcat.sh | sh

# Instalando ambiente Git
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-git.sh | sh

# Instalando ambiente Docker
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker.sh | sh

# Instalando ambiente PostgreSQL
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker-postgres.sh | sh

# Instalando ambiente MySQL
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker-mysql.sh | sh

# Atualizando senha root do phpMyAdmin
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/recovery-pass-mysql.sh | sh

# Instalando ambiente Jenkins-client
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker-jenkins.sh | sh