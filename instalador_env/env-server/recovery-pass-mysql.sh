#!/bin/sh
# Script para:
# Recuperando senha do MySQL
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo -n 'Voce conseguiu acessar o phpMyAdmin?'
echo -n 'Caso nao tenha conseguido, digite (n): '
read resposta
case "$resposta" in
    n|N|"")
# Verificando nome do container MySQL
docker ps -a
echo 'Digite o nome do container do MySQL: '
read container_name

# Acessando container MySQL
echo 'Digite sua senha MySQL atual: '
read pass_actual_mysql
mysql -u root -p$pass_actual_mysql
docker exec -it $container_name bash

# Altere a senha do usuário na tabela user do banco mysql:
echo 'Digite a nova senha: '
read nova_senha_mysql
ALTER USER root IDENTIFIED WITH mysql_native_password BY "$nova_senha_mysql";

# Saindo do MySQL e container
exit
exit
    ;;
    *)
        echo "phpMyAdmin configurado com sucesso."
    ;;
esac