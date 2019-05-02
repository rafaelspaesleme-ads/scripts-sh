#!/bin/sh
# Script para:
# Script de gestão de docker personalizado
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Apresentação
dialog --msgbox 'minha primeira tela' 5 40

# Criando parametros de input
nome_grupo=$( dialog --title 'MANAGER DOCKER' --stdout --inputbox 'Dê um nome para seu grupo docker: ' 0 0 )

# Criando grupo docker
groupadd $nome_grupo

# Adicionando usuário em questão ao grupo docker
usermod -aG $nome_grupo $USER

# Removendo possiveis erros de permissão na configuração
chown "$USER":"$USER" /home/"$USER"/.docker -R
chmod g+rwx "$HOME/.docker" -R

# Configurando docker para inicializar com o sistema.
resposta=$( dialog --title 'MANAGER DOCKER' --stdout --menu 'Escolha uma opção de inicialização do SO:' 0 0 0   1 'Ativar Docker' 2 'Desativar Docker' 3 'Cancelar' )
case "$resposta" in
    1)
        systemctl enable docker
    ;;
    2)
        systemctl disable docker
    ;;
    3)
        dialog                                            \
        --title 'MANAGER DOCKER'                             \
        --msgbox 'Cancelado.'  \
        6 40    
        ;;
esac