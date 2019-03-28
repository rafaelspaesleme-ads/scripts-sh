#!/bin/sh
# Script para:
# Instalacao do ambiente Jenkins dockerizado
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

##Configurando jenkins
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '                  DOCKERIZANDO JENKINS                    '
echo '=== = =                                            = = ==='
echo '+========================================================+'

## Verificar se já existe algum container com o nome configurado
echo 'Verifique abaixo se há algum container jenkins instalado'
docker ps -a

## Se houver eliminá-lo 
echo 'Digite o (name) do container: '
echo 'Caso não tenha, aperte ENTER: '
read name_container
docker stop $name_container
docker rm $name_container

## Executa um container na porta local 7777 alterando a url de acesso para localhost:7777/jenkins
docker run -dit --name ic_server -p 7777:8080 --env JENKINS_ARGS="--prefix=/jenkins" jenkins

# Atualizando versao do Jenkins
docker container exec -u 0 -it ic_server bash

wget http://updates.jenkins-ci.org/download/war/2.169/jenkins.war

mv ./jenkins.war /usr/share/jenkins

chown jenkins:jenkins /usr/share/jenkins/jenkins.war

exit

ls

docker restart ic_server

## Configura proxy reverse no apache 

## Criar arquivo de configuração do proxy reverso na pasta /etc/httpd/conf.d/jenkins.conf
# ProxyRequests Off

# ProxyPass /jenkins http://localhost:7777/jenkins
# ProxyPassReverse /jenkins http://localhost:7777/jenkins

# <Location "/jenkins">
#   Order allow,deny
#   Allow from all
# </Location>

# Verificando se container esta em execução
echo 'Verifique se o container esta ativo.'
docker ps -a

# Pegando senha inicial do jenkins
echo 'Digite o ID do container jenkins para acessar a senha admin inicial: '
read container_jenkins
echo 'Copie a senha e cole no navegador: (Acesse: http://seu_ip:7777)'
docker exec $container_jenkins cat /var/jenkins_home/secrets/initialAdminPassword

