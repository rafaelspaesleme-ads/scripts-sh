#!/bin/bash
# Script para:
# Escolha de criação de Dockerfile
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

escolha=$( dialog --stdout --menu 'Escolha o tipo de projeto a ser dockerizado: ' 0 0 0   1 JavaSpring 2 Node.js 3 JavaWeb 4 Cancelar )
resposta=$escolha
case "$resposta" in
    1)
        echo "Dockerizando projeto SpringBoot..."
    ;;
    2)
        echo "Dockerizando projeto Node.js..."
    ;;
    3)
        echo "Dockerizando projeto JavaWeb..."
    ;;
    4)
        echo "Cancelando..."
    ;;
    *)
        echo "Opção inválida"
    ;;
esac