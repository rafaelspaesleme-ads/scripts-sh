#!/bin/sh
# Script para:
# MySQL + Docker: executando uma instância e o mysql a partir de containers
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando Docker
curl -sSL https://get.docker.com/ | sh

# Criando rede para executar o container
docker network create --driver bridge mysql-network

# Criando o container MySQL
# Criando diretorio para dados do database
mkdir -p /opt/mysql

# Inserindo senha MySQL
echo 'Crie a senha MySQL (que servira tambem ao phpMyAdmin): '
read senha_mysql

# Criando container MySQL
docker run -d \ 
    --name mysql-network-mysql \ 
    --network mysql-network \ 
    -e MYSQL_ROOT_PASSWORD=$senha_mysql \ 
    -v /opt/mysql:/var/lib/mysql \ 
    -p 3306:3306 \ 
    mysql:8.0.12

# Criando container phpMyAdmin
docker run -d \
    --name mysql-network-phpmyadmin \
    --network mysql-network \
    -e PMA_HOST=mysql-network-mysql \
    -p 8036:80 \
    phpmyadmin/phpmyadmin:edge

# ativando permissoes
chmod 777 /var/lib/mysql    

echo '(WARNING) A senha de root sera vazio ou a mesma do MySQL!'

# Verificando se container esta ativo
docker ps

# Abrindo o container na pagina web
# Verificando qual IP da imagem em questao
ifconfig -a

# Insira o ip do jenkins
echo 'Insira o IP do container do phpMyAdmin: '
read host_ip_phpMyAdmin

# Abrindo url do jenkins
xdg-open http://$host_ip_phpMyAdmin:8036