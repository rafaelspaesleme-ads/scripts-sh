#!/bin/bash
# Script para:
# Escolha de criação de Dockerfile
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo "Escolha o tipo de projeto a ser dockerizado"
echo -n "(S)Java Spring - (N)Node.js - (J)Java Web - (C)Cancelar [A] "
read resposta
case "$resposta" in
    s|S|"")
        echo "Dockerizando projeto SpringBoot..."
    ;;
    n|N)
        echo "Dockerizando projeto Node.js..."
    ;;
    j|J)
        echo "Dockerizando projeto JavaWeb..."
    ;;
    c|C)
        echo "Cancelando..."
    ;;
    *)
        echo "Opção inválida"
    ;;
esac