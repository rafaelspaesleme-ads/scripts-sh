#!/bin/sh
# Script para:
# Instalacao completa de ambiente de trabalho de servidor linux para desenvolvedores
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

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

# 