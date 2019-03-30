#!/bin/sh
# Script para:
# Instalando Java
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando Java... ... . . . .   .  .  .'

# Desinstalando versoes antigas
apt-get purge openjdk*

# Adicionando repositorio do Java 8 e 10
add-apt-repository ppa:webupd8team/java
add-apt-repository ppa:linuxuprising/java

# atualizando pacotes
apt-get update

# Instalando Java 8
apt-get install oracle-java8-installer

# Instalando Java 10
apt-get install oracle-java10-installer

# Declarando Java 8 como padrao
apt-get install oracle-java8-set-default

# Verificando instalacao do Java
java -version

echo 'Java install succefull!'