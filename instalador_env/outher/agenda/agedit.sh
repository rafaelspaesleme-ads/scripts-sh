#!/bin/bash
# agedit.sh
# Modulo de edicao da agenda
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

# Mostra resultado da pesquisa
$DIA --sterr --backtitle "$mens0" --title "Agenda Telefonica" --no-cancel --editbox agenda.db 15 50 > /dev/null 2> $arqtmp 

# Confirma Atualizacao
$DIA --sterr --title "Confirmacao" --yesno \
"Confirma atualizacao da base de dados?" \
0 0 \

if [ $? == 0 ]; then
   cp agenda.db agenda.db.bak
   atualiza="cat $arqtmp > agenda.db"
fi

#Chama o menu
./agenda.sh

