#!/bin/bash

if [ -e "./DevOps" ]
   then
      echo "O diretorio DevOps ja existe"
   else
      echo "Excluindo repositorio antigo DevOps"
      rm -R ./DevOps/
fi
