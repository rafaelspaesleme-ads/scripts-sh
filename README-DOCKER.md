# INSTALAÇÃO DO AMBIENTE DOCKER E COMPONENTES PARA DESENVOLVIMENTO

## AMBIENTE
Local: Linux ou Windows (Via PowerShell ou GitBash -> requer instalação.)
Server: Linux

```Essa documentação ainda esta em construção.```
```This documentation is still under construction.```

## VERSÃO 1.0
Passos da instalação do ambiente de desenvolvimento dockerizado (Via remote shh).

```
PASSO #1

# Abra o terminal linux local (Comando atalho Ubuntu 18.04: CTRL + ALT + T)

-

PASSO #2

# Realize a conexão com seu servidor via SSH

sudo ssh $user@$host_server
password: $mypassword
confirm connection: yes

-

PASSO #3

# Instalação do ambiente docker.

curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker.sh | sh

-

PASSO #4

# Instale o ambiente de banco de dados dockerizado

# Ambiente dockerizado PostgreSQL

curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker-postgres.sh | sh

# Ambiente dockerizado MySQL

curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/install-docker-mysql.sh | sh

# Obs.: Após a instalação do MySQL, se faz necessário trocar a senha do usuário root do phpMyAdmin.
# Trocando senha root do phpMyAdmin

curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/recovery-pass-mysql.sh | sh

-

PASSO #5

# Dockerizando aplicação (Aplicação Spring Boot)
# Abra o terminal na pasta principal do seu projeto SpringBoot e execute o script abaixo.

curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/create-dockerfile-spring.sh | sh

```