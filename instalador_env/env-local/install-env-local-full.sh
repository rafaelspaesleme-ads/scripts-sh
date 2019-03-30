#!/bin/sh
# Script para:
# Instalando ambiente de desenvolvimento local
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Iniciando instalacao

dialog                                          \
   --title 'INSTALADOR DE AMBIENTE DEV LOCAL'                              \
   --yesno '\nBem vindo ao instalador do ambiente do desenvolvedor.
            \nDeseja realizar instalacao do ambiente?\n\n'    \
   0 0 ; 
   
echo Retorno: $?

if [ $? = 0 ]; then




else
        echo 'Ok, não vou mostrar as horas.'
fi