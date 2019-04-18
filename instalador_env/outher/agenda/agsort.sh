#!/bin/bash
# agsort.sh
# Modulo de organizacao da agenda
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


# Confirma Atualizacao
$DIA --sterr --title "Confirmacao" --yesno \
"Confirma organizacao da base de dados?" \
0 0 \

if [ $? == 0 ]; then
   cp agenda.db agenda.db.bak
   sort agenda.db -f -d -o agenda.db
fi

#Chama o menu
./agenda.sh