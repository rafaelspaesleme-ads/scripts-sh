#!/bin/sh
# Script para montagem do services jenkins
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======= = -   CRIANDO DOCKERFILE SPRING BOOT   - = ======='
echo '=== = =                                            = = ==='
echo '+========================================================+'

echo 'Buildando sua aplicação... . . .  .  .  .'
mvn clean install
#imagem do pacote de execucao da apicacao em questao
# FROM openjdk:8-jdk-slim
echo 'Abaixo você vai inserir a imagem referente a sua aplicação.'
echo 'Ex.: openjdk:8-jdk-slim'
echo 'Fonte de pesquisa de imagens: https://hub.docker.com/_/openjdk'
echo '---'
echo 'Insira a imagem desejada: '
read from_image

#Criando diretorio para o microservice (aplicacao)
# WORKDIR /app
echo 'Dê o nome ao diretorio de trabalho que ficará dentro do container:'
read workdir_app

echo 'Você precisará abrir o arquivo pom.xml do seu projeto e deixa-lo aberto em segundo plano.'
#Copie o .jar no diretório de trabalho
# COPY target/JavaSpringCRUD-0.0.1-SNAPSHOT.jar /app
echo 'Insira o nome do parametro "name" contido no arquivo pom.xml: '
read name_app

echo 'Insira o a versão do snapshot contido no arquivo pom.xml: '
read version_snapshot

cont_snap="-SNAPSHOT"
if [[ "$version_snapshot" == *"$cont_snap"* ]]; then
   version_snap="$version_snapshot"
else
   version_snap="$version_snapshot$cont_snap"
fi

app_jar="$name_app-$version_snap.jar"

#Configuracao de porta
# EXPOSE 8081
echo 'Insira a porta da sua aplicação: '
read port_app

#Comando que será executado assim que executarmos o contêiner
# CMD ["java","-jar","JavaSpringCRUD-0.0.1-SNAPSHOT.jar"]
aspas='"'
j_java='java'
j_jar='-jar'
cmd_exec="[$aspas$j_java$aspas,$aspas$j_jar$aspas,$aspas$app_jar$aspas]"

echo "FROM $from_image\nWORKDIR /$workdir_app\nCOPY target/$app_jar /$version_snap\nEXPOSE $port_app\nCMD $cmd_exec" >> Dockerfile

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======= = -   DOCKERFILE CRIADO COM SUCESSO!   - = ======='
echo '=== = =                                            = = ==='
echo '+========================================================+'
echo '-'
echo '-'
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======= = - INICIANDO DOCKERIZAÇÃO DA APLICAÇÃO - = ======'
echo '=== = =                                            = = ==='
echo '+========================================================+'

echo '-'
echo '-'

# Criando imagem docker da aplicação
echo 'Digite um nome para ser sua imagem Docker: '
read my_image_docker
docker build -t $my_image_docker .

# Usando a imagem para criar um container em execução
docker run $my_image_docker

# Verificando se container esta ativo
docker ps
