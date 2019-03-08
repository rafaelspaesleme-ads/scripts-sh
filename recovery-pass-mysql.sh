#!/bin/sh
# Script para:
# Recuperando senha do MySQL
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Pare o serviço MySQL
/etc/init.d/mysql stop

# Editar o arquivo de configuração do mysql, que por padrão fica no:
/etc/mysql/my.cnf
/etc/my.cnf

# Ao abrir o arquivo, adicione os parâmetros a seguir abaixo do módulo [mysqld]:
[mysqld]
 
skip_networking
skip_grant_tables

# Salve o arquivo e inicie o serviço MySQL:
/etc/init.d/mysql start

# Acessando o MySQL sem informar nenhum parâmetro de senha:
mysql -u root -p
Enter password: 

# Altere a senha do usuário na tabela user do banco mysql:
echo 'Digite a nova senha: '
read nova_senha_mysql
update mysql.user set password = password($nova_senha_mysql) where user = 'root';

# Alterando privilegios
flush privileges;

# Removendo os parâmetros skip_networking e skip_grant_tables do arquivo
# de configuração my.cnf e reiniciar o mysql
/etc/init.d/mysql restart