#!/bin/sh
# Script para:
# Instalacao de images uteis docker
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Criando imagem node
docker pull node

# Criando imagem java
docker pull java

# Criando imagem maven
docker pull maven

# Criando imagem python 
docker pull python

# Criando imagem React-base
docker pull bayesimpact/react-base

# Criando imagem MySQL
docker pull mysql

# Criando imagem PostgreSQL
docker pull postgres

# Criando imagem MongoDB
docker pull mongo

# Criando imagem do Jenkins
docker pull jenkins

# Criando imagem do Bash Script
docker pull bash

# Criando imagem do Tomcat
docker pull tomcat


