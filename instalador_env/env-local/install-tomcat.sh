#!/bin/sh
# Script para:
# Instalando tomcat
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando tomcat... ... . . . .   .  .  .'

# Atualizando pacotes
apt-get update

# verificando versao java
java -version

# Instalando versoes de desenvolvimento do java
apt-get install default-jdk

# Instalando tomcat
apt-get install tomcat7

# Startando tomcat
apt-get install tomcat7

# Testando tomcat
echo $CATALINA_HOME
echo $JAVA_HOME

echo 'Tomcat install succefull!'
