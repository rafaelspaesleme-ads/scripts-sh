#!/bin/sh
# Script para:
# Instalacao do Docker
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando Docker
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo 'Iniciando instalação do Docker CE... . . .  .  .  .   .   '
echo '=== = =                                            = = ==='
echo '+========================================================+'
# curl -sSL https://get.docker.com/ | sh

# Atualizar o sistema
apt update
apt upgrade

# Instalando alguns pacotes necessários à instalação do Docker, usando o comando abaixo
apt-get install apt-transport-https ca-certificates curl gnupg software-properties-common

# Adicionando a chave GPG do repositório do Docker. Isso serve para adicionar ainda mais segurança aos pacotes que serão baixados;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicionar o repositório do Docker
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Instalando o docker
apt install docker-ce

# Ativando serviço para inicialização do sistema
systemctl enable docker

# Startando serviço na inicialização do sistema
systemctl start docker

echo -n 'Deseja instalar o docker-compose?'
echo -n 'Digite (s) para confirmar ou (n) para cancelar: '
read resposta
case "$resposta" in
    s|S|"")

        echo '+========================================================+'
        echo '=== = =                                            = = ==='
        echo 'Carregando instalação do docker compose... . . .  .  .  . '
        echo '=== = =                                            = = ==='
        echo '+========================================================+'

        # Instalando o docker compose
        curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

        # Aplicando permissões
        chmod +x /usr/local/bin/docker-compose

        # Criando link simbolico para o pasta bin em user
        ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

        # echo '+========================================================+'
        # echo '=== = =                                            = = ==='
        # echo '======== VERIFICANDO INSTALAÇÕES DOCKER & COMPOSE ========'
        # echo '=== = =                                            = = ==='
        # echo '+========================================================+'
        # Verificando se a instalação ocorreu com sucesoo
        # systemctl status docker

        # Visualizando a versão do sistema
        # docker -v

        # Testando instalação
        # docker-compose --version

    ;;
    *)

        echo "Install docker-compose canceled."

    ;;
esac
