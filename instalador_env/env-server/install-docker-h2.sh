#!/bin/sh
# Script para:
# H2 + Docker: Dockerizando banco de dados H2
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Download da imagem dockerizada do H2 Database
docker pull oscarfonts/h2

# Executando imagem, transfomando-a em um container ativo
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data --name=MyH2Instance oscarfonts/h2

# Status do H2
echo "Banco de dados H2 dockerizado com sucesso.             "
echo "++===================================================++"
echo "Veja abaixo os status do H2 ---------------------------"
echo "++===================================================++"
echo "+                                                     +"
echo "PORTA WEB: 81 | PORTA H2: 1521 | USER: sa | PASS: null "
echo "CLIQUE E ACESSE: http://localhost:81 ------------------"

# Acessando banco h2 pelo navegador
apt install links2
apt install awk

links2 http://localhost:81

hostname -I | awk '{print $1}'

links2 $1:81
