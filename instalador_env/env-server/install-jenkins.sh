#!/bin/sh
# Script para montagem do services jenkins
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# ============================= AINDA EM DESENVOLVIMENTO =============================

# =============== Passo 1 - Instalando Jenkins
# Adicionando chave do repositorio jenkins ao S.O.
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - 


# Em seguida, acrescente o endereço do repositório de pacotes Debian ao servidor sources.list
echo "deb http://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list 


# Quando ambos estiverem no lugar, execute de updatemodo a aptusar o novo repositório:
apt update 


# Finalmente, instale o Jenkins e suas dependências:
apt install jenkins 


# =============== Passo 2 - Iniciando Jenkins
# Agora que o Jenkins e suas dependências estão no lugar, vamos iniciar o servidor Jenkins.
systemctl start jenkins 


# Como systemctlnão exibe a saída, você pode usar seu statuscomando para verificar se o Jenkins foi iniciado com sucesso:
systemctl status jenkins 


# =============== Etapa 3 - Abrindo o Firewall
# Por padrão, o Jenkins é executado na porta 7474, então vamos abrir essa porta usando ufw:
ufw allow 7474


# Verifique ufwo status para confirmar as novas regras:
ufw status 


# Se o firewall estiver inativo, os seguintes comandos permitirão o OpenSSH e ativarão o firewall:
ufw allow OpenSSH 
ufw enable 


# =============== Passo 4 - Configurando Jenkins
# Abrindo o service na pagina web
# Verificando qual IP do jenkins
ifconfig -a 

# Insira o ip do jenkins
echo 'Insira o IP do jenkins: '
read host_ip_jenkins

# Abrindo url do jenkins
xdg-open http://$host_ip_jenkins:8080
