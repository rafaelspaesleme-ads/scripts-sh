#!/bin/bash
# agenda.sh
#
# Modulo de menu da agenda
#

DIALOG=`which Xdialog` 
if [ ! $DIALOG ] ;then 
   echo " Xdialog nao encontrado" 
   exit 1 
fi 

#
# Path do icone
icone="/usr/X11R6/include/X11/pixmaps/mouse.xpm"

#Messagem da janela
mens0="Especial para o Viva o Linux"

#Mensagem para o usuario
mens1="Informa o nome - telefone"

#variaveis
arqtmp="/$HOME/.agenda_temp"
DIA=Xdialog

# Dialogo Menu
$DIA --sterr --title "Agenda Telefonica" --backtitle "$mens0" --icon "$icone" --center --cancel-label "Sair" --menu \
"Selecione sua opcao" 16 40 5 \
"1" "Incluir na agenda" \
"2" "Pesquisar nome/telefone" \
"3" "Editar agenda" \
"4" "Organizar agenda" \
"5" "Creditos" > /dev/null 2> $arqtmp

opcao="cat $arqtmp"

#Menu
case $opcao in
1)
./agcad.sh;;
2)
./agbusc.sh;;
3)
./agedit.sh;;
4)
./agsort.sh;;
5)
$DIA --sterr --left --title "Creditos" --msgbox \
" Script criado por \n Aristoteles Araujo (Thothy) \n thothy@bol.com.br \n \n Licenca GPL \n Brasil 2003"  \
0 0
./agenda.sh
esac
