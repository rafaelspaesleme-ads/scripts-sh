#!/bin/bash

if [ -e "./DevOps" ]
   then
      echo "Excluindo repositorio antigo DevOps"
      rm -R ./DevOps/
   else
      echo "O diretorio DevOps nao existe"
fi
