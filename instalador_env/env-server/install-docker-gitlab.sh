#!/bin/sh
# Script para:
# Script instalação e configuração do gitlab no docker
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando Gitlab
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo 'Iniciando instalação do Gitlab...... . . .  .  .  .   .   '
echo '=== = =                                            = = ==='
echo '+========================================================+'
# Baixando imagem docker do Gitlab
docker pull gitlab/gitlab-ce

# Construindo e executando container do gitlab
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest

# Acessando arquivo de configuração do GitLab
docker exec -it gitlab vi /etc/gitlab/gitlab.rb

# restartndo gitlab dockerizado
docker restart gitlab


