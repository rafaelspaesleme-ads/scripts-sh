#!/bin/sh
# Script para:
# Instalacao do ambiente Java
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando o JAVA ORACLE 8 e 7 e setando o 8 como padrão;
# O script aceita os termos da Oracle automaticamente
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '=                     Instalando Java                    ='
echo '=== = =                                            = = ==='
echo '+========================================================+'

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
echo oracle-java8-set-default shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install oracle-java8-set-default -y
apt-get install oracle-java7-installer -y
