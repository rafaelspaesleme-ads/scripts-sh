#!/bin/sh
# Script para:
# MySQL + Docker: executando uma instância e o mysql a partir de containers
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando Docker
# curl -sSL https://get.docker.com/ | sh

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======== ===== -    DOCKERIZANDO MYSQL -    ===== ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Criando rede para executar o container
echo 'Dê um nome para sua rede docker que hospedará o MySQL: '
read nome_rede
docker network create --driver bridge $nome_rede

# Criando o container MySQL
# Criando diretorio para dados do database
mkdir -p /opt/mysql

# Inserindo senha MySQL
echo 'Crie a senha MySQL: '
read senha_mysql

# Criando container MySQL
docker run -d \
    --name $nome_rede-mysql \
    --network $nome_rede \
    -e MYSQL_ROOT_PASSWORD=$senha_mysql \
    -v /opt/mysql:/var/lib/mysql \
    -p 3306:3306 \
    mysql:8.0.12

# Criando container phpMyAdmin
docker run -d \
    --name $nome_rede-phpmyadmin \
    --network $nome_rede \
    -e PMA_HOST=$nome_rede-mysql \
    -p 3307:80 \
    phpmyadmin/phpmyadmin:edge

# ativando permissoes
# chmod 777 /var/lib/mysql    

# Inserindo senha de acesso ao phpMyAdmin
echo 'Crie a senha do phpMyAdmin: '
read senha_phpmyadmin
docker exec -it mysql $nome_rede-phpmyadmin -u root -p$senha_mysql -e "ALTER USER root IDENTIFIED WITH mysql_native_password BY '$senha_phpmyadmin';"

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '====+ - STATUS DA INSTALAÇÃO DO MYSQL E PHPMYADMIN - +===='
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Verificando se container esta ativo
docker ps

# Abrindo o container na pagina web
# Verificando qual IP da imagem em questao
echo 'Insira o ID do container: '
read ID_container
docker inspect $ID_container | grep "IPAddress"

# Insira o ip do jenkins
echo 'Insira o IP do container do phpMyAdmin: '
read host_ip_phpMyAdmin

# Abrindo url do jenkins
xdg-open http://$host_ip_phpMyAdmin:3307
curl http://$host_ip_phpMyAdmin:3307
