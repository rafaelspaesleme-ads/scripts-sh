#!/bin/bash
# agbusc.sh
# Modulo de busca na agenda
#
# Path do icone
icone="/usr/X11R6/include/X11/pixmaps/keyboard.xpm"

# Mensagem da janela
mens0="Especial para o Viva o Linux"

# Mensagem para o usuario
mens1="Informa o nome - telefone"

# Variaveis
arqtmp="/$HOME/.agenda_temp"
DIA=Xdialog

# Dialogo de Cadastro
$DIA --sterr --title "Agenda Telefonica" --backtitle "$mens0" --icon "$icone" --no-cancel --center --inputbox \
"Digite o nome ou telefone \n para busca na agenda" 10 40 > /dev/null 2> $arqtmp

busca="cat $arqtmp"

resultado="grep -i $busca agenda.db > $arqtmp"

if [ -n $busca ];then
   #Mostra mensagem de erro
   $DIA --sterr --title "Agenda Telefonica" --msgbox \
   "Informe nome ou telefone \n para perquisar" 0 0 \
   exit
else
   # Mostra resultado da pesquisa
   $DIA --sterr --backtitle "Resultado da pesquisa por $busca" --title "Agenda Telefonica" --no-cancel --logbox $arqtmp 15 50 \

fi

#Chama o menu
./agenda.sh
exit

