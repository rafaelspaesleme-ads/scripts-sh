#!/bin/sh
# Script para:
# Instalando Gimp
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando gimp... ... . . . .   .  .  .'

# Adicionando repositorio do programa
add-apt-repository ppa:otto-kesselgulasch/gimp-edge

# Atualize os pacotes
apt-get update

# Instalando gimp
apt-get install gimp gimp-gmic gmic

echo 'Gimp install succefull!'
