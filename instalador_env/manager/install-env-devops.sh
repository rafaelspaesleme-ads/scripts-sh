#!/bin/bash

# Criando pasta principalcc
rm -R DevOps/
mkdir "./DevOps"

# Criando subpastas
mkdir "./DevOps/projects"
mkdir "./DevOps/lib"
mkdir "./DevOps/trash"
mkdir "./DevOps/docs"
mkdir "./DevOps/config"

# Criando pasta de repositorio de projetos
mkdir "./DevOps/projects/repositories"
mkdir "./DevOps/projects/trash"
mkdir "./DevOps/projects/docs"

# Criando workspace
PROJECT_BREAK_DOWN=( `echo ${NOME_PROJECTS} | sed -e 's/[,\/]/ /g'` )

echo $PROJECT_BREAK_DOWN

for ((i=0; i<${#PROJECT_BREAK_DOWN[@]}; ++i))
do
   if [ -e "./DevOps/projects/repositories/${PROJECT_BREAK_DOWN[(($i))]}" ]
   then
      echo "O diretorio ${PROJECT_BREAK_DOWN[(($i))]} existe"
   else
      echo "Criando repositório ${PROJECT_BREAK_DOWN[(($i))]}"
      mkdir "./DevOps/projects/repositories/${PROJECT_BREAK_DOWN[(($i))]}"
   fi
done

chmod -R 777 DevOps/

scp -r DevOps/ $USER_ENV@$HOST_ENV:/$USER

$PASS_ENV


rm -R DevOps/
