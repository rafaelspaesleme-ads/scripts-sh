#!/bin/sh
# Script para:
# Instalacao completa de ambiente de trabalho de servidor linux para desenvolvedores
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '       INICIANDO INSTALACAO DO AMBIENTE DEV SERVER        '
echo '=== = =                                            = = ==='
echo '+========================================================+'

# Install or updates package
apt-get clean
apt-get update
apt-get upgrade

# Install docker
apt install docker.io

# Instalando wget
apt-get install wget

# Instalando curl
apt-get install curl

# Instalando o apache
apt-get install apache2

# Instalando o navegador lynx
apt-get install lynx

# Instalando aplicativos de rede
apt-get install traceroute
apt-get install tcpdump
apt-get install wireshark

# Fazendo conexão com o servidor via ssh
# wget https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/remote-access-ssh.sh

# Configurando rede do servidor
/tmp/scripts-sh/instalador_env/env-server/config-network-server.sh

# Instalando ambiente Java
/tmp/scripts-sh/instalador_env/env-server/install-java.sh

# Instalando ambiente Maven
# /tmp/scripts-sh/instalador_env/env-server/install-maven.sh

# Instalando o Apache Tomcat7
# /tmp/scripts-sh/instalador_env/env-server/install-tomcat.sh

# Instalando ambiente Git
# /tmp/scripts-sh/instalador_env/env-server/install-git.sh

# Instalando ambiente Docker
/tmp/scripts-sh/instalador_env/env-server/install-docker.sh

# Instalando ambiente PostgreSQL
/tmp/scripts-sh/instalador_env/env-server/install-docker-postgres.sh

# Instalando ambiente MySQL
/tmp/scripts-sh/instalador_env/env-server/install-docker-mysql.sh

# Atualizando senha root do phpMyAdmin
/tmp/scripts-sh/instalador_env/env-server/recovery-pass-mysql.sh

# Instalando ambiente H2
/tmp/scripts-sh/instalador_env/env-server/install-docker-h2.sh

escolha=$( dialog --title 'MongoDO + Docker' --stdout --menu 'Escolha o tipo de instalação deseja fazer: ' 0 0 0   1 Completa 2 Basica 3 Cancelar )
resposta=$escolha
case "$resposta" in
    1)
        echo "Essa instalacao demandara muito tempo. (CTRL+C para cancelar)"
        # Instalando ambiente H2
        /tmp/scripts-sh/instalador_env/env-server/install-docker-cls-mongoDB.sh
    ;;
     2)
        # Instalando ambiente H2
        /tmp/scripts-sh/instalador_env/env-server/install-docker-mongoDB.sh
    ;;
    3)
        echo "Instalação cancelada."
    ;;
    *)
        echo "Invalid optional."
    ;;
esac

# Instalando ambiente Jenkins-client
/tmp/scripts-sh/instalador_env/env-server/install-docker-jenkins.sh

# Instalando ambiente GitLab dockerizado
/tmp/scripts-sh/instalador_env/env-server/install-docker-gitlab.sh
