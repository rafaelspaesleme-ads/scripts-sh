#!/bin/sh
# Script para:
# Instalacao do ambiente maven
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

#Instalando o MAVEN 3 na versão 3.6.0
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '=                     Instalando Maven                   ='
echo '=== = =                                            = = ==='
echo '+========================================================+'

wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar -zxvf  apache-maven-3.6.0-bin.tar.gz
mv  apache-maven-3.6.0/ /opt/
rm  apache-maven-3.6.0-bin.tar.gz
echo "export M3_HOME=/opt/ apache-maven-3.6.0" >> ~/.bashrc
echo "export M3=\$M3_HOME/bin" >> ~/.bashrc
echo "export PATH=\$M3:\$PATH" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

source ~/.bashrc