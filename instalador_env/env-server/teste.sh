#!/bin/sh
# Script para criação de container docker com node
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======= = -      CRIANDO DOCKERFILE NODE       - = ======='
echo '=== = =                                            = = ==='
echo '+========================================================+'

#imagem do pacote de execucao da apicacao em questao
# FROM node:7
echo 'Abaixo você vai inserir a imagem referente a sua aplicação.'
echo 'Ex.: node:7'
echo 'Fonte de pesquisa de imagens: https://hub.docker.com/_/node/'
echo '---'
echo 'Digite o nome da imagem desejada: '
read image_node

# COPY package.json
echo 'Insira o nome do arquivo de configuração do node (ex.: package.json): '
read package_json

echo 'Digite o nome do arquivo index: '
read file_index

#Configuracao de porta
# EXPOSE 8081
echo 'Insira a porta da sua aplicação: '
read port_app

# FROM node:7
# WORKDIR /app
# COPY package.json /app
# RUN npm install
# COPY . /app
# CMD node index.js
# EXPOSE 8081

        echo "FROM $image_node" >> Dockerfile
        echo "WORKDIR /app" >> Dockerfile
        echo "COPY $package_json /app" >> Dockerfile
        echo "RUN npm install" >> Dockerfile
        echo "COPY . /app" >> Dockerfile
        echo "CMD node $file_index" >> Dockerfile
        echo "EXPOSE $port_app" >> Dockerfile