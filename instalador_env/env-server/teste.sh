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
nome_rede=$( dialog --title 'DOCKER NODE' --stdout --inputbox 'Digite o nome da imagem desejada\n(EX.: node:7)\n\nFonte de pesquisa de imagens: https://hub.docker.com/_/node/' 0 0 )
read image_node

# COPY package.json
nome_rede=$( dialog --title 'DOCKER NODE' --stdout --inputbox 'Insira o nome do arquivo de configuração do node\n(ex.: package.json): ' 0 0 )
read package_json

echo 'Digite o nome do arquivo index: '
nome_rede=$( dialog --title 'DOCKER NODE' --stdout --inputbox 'Insira o nome do arquivo de configuração do node\n(ex.: package.json): ' 0 0 )
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


dialog --yesno 'Deseja Criar mais um projeto?' 0 0

if [ $? = 0 ]; then
        
    nomeProject=$( dialog --title 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite um nome para seu projeto: ' 0 0 )
    mkdir "${FOLDER}/DevOps/projects/repositories/${nomeProject}"

    dialog --yesno 'Deseja Criar mais um projeto?' 0 0

    if [ $? = 0 ]; then
            
        nomeProject=$( dialog -- 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite um nome para seu projeto: ' 0 0 )
        mkdir "${FOLDER}/DevOps/projects/repositories/${nomeProject}"

        dialog --yesno 'Deseja Criar mais um projeto?' 0 0

        if [ $? = 0 ]; then
                
            nomeProject=$( dialog -- 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite um nome para seu projeto: ' 0 0 )
            mkdir "${FOLDER}/DevOps/projects/repositories/${nomeProject}"

            dialog --yesno 'Deseja Criar mais um projeto?' 0 0

            if [ $? = 0 ]; then
                
                nomeProject=$( dialog -- 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite um nome para seu projeto: ' 0 0 )
                mkdir "${FOLDER}/DevOps/projects/repositories/${nomeProject}"

                dialog --yesno 'Deseja Criar mais um projeto?' 0 0

                if [ $? = 0 ]; then
                
                    nomeProject=$( dialog -- 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite um nome para seu projeto: ' 0 0 )
                    mkdir "${FOLDER}/DevOps/projects/repositories/${nomeProject}"

                else
                    for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --title "STRUCTURE DEVOPS-CI" --gauge "Criando workspace..." 10 70 0; done
                fi

            else
                for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --title "STRUCTURE DEVOPS-CI" --gauge "Criando workspace..." 10 70 0; done
            fi

        else
            for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --title "STRUCTURE DEVOPS-CI" --gauge "Criando workspace..." 10 70 0; done
        fi
            
    else
        for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --title "STRUCTURE DEVOPS-CI" --gauge "Criando workspace..." 10 70 0; done
    fi
else
        for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --title "STRUCTURE DEVOPS-CI" --gauge "Criando workspace..." 10 70 0; done
fi