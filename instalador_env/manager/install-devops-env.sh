#!/bin/bash

# Criando pasta principal
mkdir "${FOLDER}/DevOps"

# Criando subpastas
mkdir "${FOLDER}/DevOps/projects"
mkdir "${FOLDER}/DevOps/lib"
mkdir "${FOLDER}/DevOps/trash"
mkdir "${FOLDER}/DevOps/docs"
mkdir "${FOLDER}/DevOps/config"

# Criando pasta de repositorio de projetos
mkdir "${FOLDER}/DevOps/projects/repositories"
mkdir "${FOLDER}/DevOps/projects/trash"
mkdir "${FOLDER}/DevOps/projects/docs"

# Criando workspace
PROJECT_BREAK_DOWN=( `echo ${NOME_PROJECTS} | sed -e 's/[,\/]/ /g'` )

echo $PROJECT_BREAK_DOWN

for ((i=0; i<${#PROJECT_BREAK_DOWN[@]}; ++i))
do
   if [ -e "${FOLDER}/DevOps/projects/repositories/${PROJECT_BREAK_DOWN[(($i))]}" ]
   then
      echo "O diretorio ${PROJECT_BREAK_DOWN[(($i))]} existe"
   else
      echo "Criando repositório ${PROJECT_BREAK_DOWN[(($i))]}"
      mkdir "${FOLDER}/DevOps/projects/repositories/${PROJECT_BREAK_DOWN[(($i))]}"
   fi
done

chmod -R 756 "${FOLDER}/DevOps*"
