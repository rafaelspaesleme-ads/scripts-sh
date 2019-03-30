#!/bin/sh
# Script para:
# Instalando Maven
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando e configurando maven... ... . . . .   .  .  .'

# atualizando pacotes
apt-get update

# Instalando Maven
apt-get install maven

# Verificando versao do maven
mvn -version

# Configurando o maven
export MAVEN_HOME=/usr/share/maven
export PATH=$MAVEN_HOME/bin:$PATH

# restartando service do maven
service maven restart

# Limpando e construindo maven
mvn clean install

echo 'Maven install succefull!'
