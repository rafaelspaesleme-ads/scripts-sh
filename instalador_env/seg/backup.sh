#!/bin/sh
# Script para:
# Script de criacao de backup automatizado
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme


# Escrevendo diretorio do arquivo ou pasta que enviará para backup

hoje=$(date +"%d%m%y")
mkdir /backup

dialog                                          \
   --title 'BACKUP AUTOMATIZADO'                              \
   --yesno '\nBem vindo ao backup automatizado linux.
            \nDeseja começar o backup agora?\n\n'    \
   0 0 ; 
   
echo Retorno: $?

if [ $? = 0 ]; then

escolha=$( dialog --title 'BACKUP AUTOMATIZADO' --stdout --menu 'Qual tipo de backup deseja iniciar?' 0 0 0   1 Personalizado 2 Basico 3 Completo 4 Critico )
resposta=$escolha
case "$resposta" in
    1)
    local=$( dialog --title 'Backup personalizado' --stdout --inputbox 'Digite o caminho local do arquivo para backup: ' 0 0 )
    local_file=$( dialog --title 'Backup personalizado' --stdout --inputbox 'Digite o arquivo para backup: ' 0 0 )

    chmod -R 777 /backup/*

    backup1="$local_file-$RANDOM-$hoje.tar"

    chmod -R 777 $local$local_file

    tar -zcf $local$backup1 $local$local_file
    chmod -R 777 $local$backup1
    mv $local$backup1 /backup/

    chmod -R 760 $local$local_file
    chmod -R 760 /backup/*
    
    for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'Backup personalizado'        \
   --gauge '\nRealizando backup personalizado, aguarde...'  \
   10 70 0; done

    ;;
    2)
   
    for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'Backup basico'        \
   --gauge '\nRealizando backup basico (pasta do usuário), aguarde...'  \
   10 70 0; done

   backup2="home-$RANDOM-$hoje.tar"

   chmod -R 777 /backup/*
   chmod -R 777 /home/*

   tar -R -zcf $backup2 /home/*
   chmod -R 777 $backup2
   mv $backup2 /backup/

   chmod -R 760 /backup/*
   chmod -R 760 /home/*

    ;;
    3)
    
    for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'Backup completo'        \
   --gauge '\nRealizando backup completo (pasta principal do sistema), aguarde...'  \
   10 70 0; done

   backup2="local-$RANDOM-$hoje.tar"

   chmod -R 777 /backup/*
   chmod -R 777 /*

   tar -R -zcf $backup2 /*
   chmod -R 777 $backup2
   mv $backup2 /backup/

   chmod -R 760 /backup/*
   chmod -R 760 /*

    ;;
    4)
    
    for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'Backup critico'        \
   --gauge '\nRealizando backup critico (pasta user ou superuser), aguarde...'  \
   10 70 0; done

   backup2="$USER-$RANDOM-$hoje.tar"

   chmod -R 777 /backup/*
   chmod -R 777 /$USER/*

   tar -R -zcf $backup2 /$USER/*
   chmod -R 777 $backup2
   mv $backup2 /backup/

   chmod -R 760 /backup/*
   chmod -R 760 /$USER/*

    ;;
    *)

    for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'OPÇÃO INVALIDA'        \
   --gauge '\nSaindo do backup, agaurde...'  \
   10 70 0; done

    exit

    ;;
esac

else
        echo 'Procedimento cancelado.'
fi