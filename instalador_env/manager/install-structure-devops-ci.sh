#!/bin/sh
# Script para:
# Script de gestão de docker personalizado
# Execute esse script como root
# Executado num ambiente Debian 8||< com 2048 MB de memória;
# Create per Rafael Paes Leme

# Tela de abertura
for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --title "STRUCTURE DEVOPS-CI" --gauge "Carregando instalações..." 10 70 0; done

# Escolhendo o local para implantar estrutura DevOps CI
dialog --title "INSTALL STRUCTURE CI" --fselect /path/to/dir height width
FOLDER=$(dialog --stdout --title "Escolha um local para montar sua estrutura DevOps-CI" --fselect $PWD/ 14 48)
echo "${FOLDER} DevOps - Zaal."

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
nomeProject=$( dialog --title 'STRUCTURE DEVOPS-CI' --stdout --inputbox 'Digite os nomes dos repositorios dos projetos que deseja criar!\n\nSepare-os por virgula\n\n(ex.: project-java, project-php, project-python): ' 0 0 )

PROJECT_BREAK_DOWN=( `echo ${nomeProject} | sed -e 's/[,\/]/ /g'` )

COUNTER=1
for i in {1..$PROJECT_BREAK_DOWN}
do
   mkdir "${FOLDER}/DevOps/projects/repositories/${PROJECT_BREAK_DOWN[$COUNTER]}"
   COUNTER=$((COUNTER+1))
done

