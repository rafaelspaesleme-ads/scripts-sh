#!/bin/sh
# Script para:
# PostgreSQL + Docker: executando uma instância e o pgAdmin 4 a partir de containers
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando Docker
# curl -sSL https://get.docker.com/ | sh 
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '======== ===== - DOCKERIZANDO  POSTGRESQL - ===== ========'
echo '=== = =                                            = = ==='
echo '+========================================================+'
# Obtendo as imagens necessárias
# Imagem do postresql
docker pull postgres 

# Imagem do pgAdmin4
docker pull dpage/pgadmin4 

# Criando uma network para execução dos containers
nome_rede=$( dialog --title 'Rede PostgreSQL' --stdout --inputbox 'Digite um nome para sua rede: ' 0 0 )
docker network create --driver bridge $nome_rede

# Verificando redes docker/ deverá aparecer então a rede postgres-network
docker network ls 

# Criando um container para executar as imagens do PostgreSQL
senha_postgres=$( dialog --title 'Security PostgreSQL' --stdout --inputbox 'Crie uma senha para o serviço Postgres: ' 0 0 )
docker run --name $nome_rede-postgres --network=$nome_rede -e "POSTGRES_PASSWORD=$senha_postgres" -p 5432:5432 -v /home/Docker/containers/PostgreSQL:/var/lib/postgresql/data -d postgres

# Verificando se container esta ativo
docker ps 

# Criando um container para execução do pgAdmin 4
email_pgadmin=$( dialog --title 'User pgAdmin4' --stdout --inputbox 'Crie um email para o serviço pgAdmin4: ' 0 0 )
senha_pgadmin=$( dialog --title 'Security pgAdmin4' --stdout --inputbox 'Crie uma senha para o serviço pgAdmin4: ' 0 0 )
docker run --name $nome_rede-pgadmin --network=$nome_rede -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=$email_pgadmin" -e "PGADMIN_DEFAULT_PASSWORD=$senha_pgadmin" -d dpage/pgadmin4

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '====+ - STATUS DA INSTALAÇÃO DO POSTGRES E PGAGMIN - +===='
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Verificando se container esta ativo
docker ps 

# Abrindo o container na pagina web
# Verificando qual IP da imagem em questao
# echo 'Insira o ID do container: '
# read ID_container
# docker inspect $ID_container | grep "IPAddress"

# Insira o ip do pgAdmin 4
# echo 'Insira o IP do container do pgAdmin4: '
# read host_ip_pgadmin4

# Abrindo url do pgAdmin 4
# Ubuntu
# xdg-open http://$host_ip_pgadmin4:15432
# Servidor
# curl http://$host_ip_pgadmin4:15432