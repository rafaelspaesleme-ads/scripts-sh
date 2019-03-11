![alt text](https://www.callicoder.com/assets/images/post/large/spring-boot-docker.jpg)

# DOCKERIZANDO UMA APLICAÇÃO SPRING BOOT

## AMBIENTE
Local: Linux ou Windows (Via PowerShell ou GitBash -> requer instalação.)
Server: Linux

```Essa documentação ainda esta em construção.```
```This documentation is still under construction.```

## VERSÃO 1.0
Passos da instalação do ambiente de desenvolvimento dockerizado (Via remote shh).

```

PASSO #1

# Abra o terminal linux local dentro da pasta principal do seu projeto SpringBoot

-

PASSO #2

# Realize a conexão com seu servidor via SSH

sudo ssh $user@$host_server
password: $mypassword
confirm connection: yes

-

PASSO #3

# Escolha um local para criar o repositorio do seu projeto SpringBoot

# Listar diretorios no servidor 
sudo ls --all

ou

sudo dir --all

# Vá até o diretorio desejado através do comando abaixo:

cd local/do/repositorio/do/projeto/spring/

# Crie a pasta que ficará o seu projeto SpringBoot

mkdir ProjetoSpringBoot

-

PASSO #4

# Transfira seu projeto do seu ambiente local, para o seu servidor através do comando abaixo:

# transferencia de arquivos gerais
sudo scp userLocal@hostLocal:/* userServer@hostServer:ProjetoSpringBoot/*

# transferencia de pastas e subpastas
sudo scp -r userLocal@hostLocal:* userServer@hostServer:ProjetoSpringBoot

-

PASSO #5

# Acesso a pasta principal do seu projeto no servidor:

cd ProjetoSpringBoot/

# De permissões para manipulação do seu projeto

sudo chmod +x *

ou

sudo chmod 777 * (Não recomendado. Somente em caso de testes.)

-

PASSO #6

# Criando Dockerfile, criando imagem Docker e levantando container (Aplicação Spring Boot)

curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/create-dockerfile-spring.sh | sh


```