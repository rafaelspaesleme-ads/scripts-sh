#!/bin/sh
# Script para:
# MongoDB + Docker: Dockerizando banco de dados MongoDB
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Baixando imagem docker
docker pull tutum/mongodb

# Subindo container docker
senha_mongoDB=$( dialog --title 'User MongoDB' --stdout --inputbox 'Digite a senha para (user admin):' 0 0 )
echo "Digite um nome para o container: "
read name_container
docker run --name $name_container -d -p 27017:27017 -p 28017:28017 -e MONGODB_PASS="$senha_mongoDB" tutum/mongodb

# Startando container
docker start $name_container