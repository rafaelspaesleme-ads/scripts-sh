#!/bin/bash
# agcad.sh
# Modulo de cadastro de agenda
#
# Path do icone
icone="/usr/X11R6/include/X11/pixmaps/keyboard.xpm"

# Mensagem da janela
mens0="Especial para o Viva o Linux"

# Mensagem para o usuario
mens1="Informa o nome - telefone"

#Variaveis
arqtmp="/$HOME/.agenda_temp"
DIA=Xdialog

# Dialogo de Cadastro
$DIA --sterr --title "Agenda Telefonica" --backtitle "$mens0" --icon "$icone" --center --inputbox \
"Digite o nome e o telefone" 10 40 > /dev/null 2>> agenda.db

./agenda.sh

