#!/bin/bash

GIT_URL=$REPOSITORY_GITHUB_OR_BITBUCKET
GIT_CURRENT_BRANCH=$MY_BRANCH

OPTION=$1
PARAMETER1=$2
PARAMETER2=$3

function checkDivergence
{
  cd 'dirname "$0"'

  exec 200>"locker" && flock -n 200 || exit 1
}

function urlencode() 
{
  local LANG=C i c e=''
  for ((i=0;i<${#1};i++))
  do
    c=${1:$i:1}
    [[ "$c" =~ [a-zA-Z0-9\.\~\_\-] ]] || printf -v c '%%%02X' "'$c"
    e+="$c"
  done
  echo "$e"
}

function checkSO
{
  if [[ 'uname -r' =~ Microsoft$ ]]
  then
    return 1
  else
    return 0
  fi
}

function isFirstRun
{
  if [[ ! -d ".git" ]] || [[ -n "$isFirstTime" ]]
  then
    isFirstTime="yes"
    return 0
  else
    return 1
  fi
}

function installNecessaryPackages
{
  sudo apt-get update
  sudo apt-get -y install software-properties-common
  sudo add-apt-repository -y ppa:git-core/ppa
  sudo apt-get update
  sudo apt-get -y install git
  sudo apt-get -y install sed
}

function readUsernameAndPassword
{
  read -p "Type your git username: " USERNAME
  read -p "Type your git password: " PASSWORD

  REMOTE=${GIT_URL//https\:\/\//https\:\/\/'urlencode $USERNAME'\:'urlencode $PASSWORD'\@}
}

function readEmailAndName
{
  read -p "Type your git email: " EMAIL
  read -p "Type your git name: " NAME
}

function readBranch
{
  local MESSAGE=$1
  local REMOTE=$2
  
  while true
  do 
    read -p "$MESSAGE" BRANCH

    if [[ -n 'git ls-remote --heads $REMOTE $BRANCH' ]]
    then
      break
    else
      echo -e "Branch inexistente.\n"
    fi
  done
}

function choiceBranch
{
  echo "Wait!"
  git fetch --all >&- 2>&-
  readBranch "Type your branch: " "origin"
  local NEWFILE='sed "0,/GIT_CURRENT_BRANCH=.*/s/GIT_CURRENT_BRANCH=.*/GIT_CURRENT_BRANCH=$BRANCH/" $0'
  git checkout -f $BRANCH
  git merge
  echo "$NEWFILE" > $0
}

function pullAndCommit 
{
  local BACKUP_BRANCH=backup_'date +%s'
  local MESSAGE=$PARAMETER1

  if [[ -z "$MESSAGE" ]]
  then
    MESSAGE="Atualizando scripts..."
  fi 

  if isFirstRun
  then
    git checkout -b $BACKUP_BRANCH
    git add -A
    git commit -m "$MESSAGE"
    git fetch --all
    git checkout -f $GIT_CURRENT_BRANCH
    git merge
    git checkout $BACKUP_BRANCH -- .
    git branch -D $BACKUP_BRANCH
  else
    git fetch --all
    git merge
  fi

  git rm . -r --cached
  git add -A
  git commit -m "$MESSAGE"
  git push
}  

function merge 
{
  readBranch "Digite sua branch: " "origin"
  local SOURCE=$BRANCH
  readBranch "Digite o destino dessa branch: " "origin"
  local DESTINATION=$BRANCH

  local BACKUP_BRANCH=backup_'date +%s'
  git checkout -b $BACKUP_BRANCH
  git add -A
  git commit -m "backup"

  git fetch --all
  git checkout -f $DESTINATION
  git merge
  git merge $SOURCE
  git checkout $SOURCE -- .
  git add -A
  git commit -m "Resolvendo conflitos..."
  git push

  git checkout -f $GIT_CURRENT_BRANCH
  git merge
  git rm -rf "*"
  git checkout $BACKUP_BRANCH -- .
  git branch -D $BACKUP_BRANCH
}

 
function showOptions
{
  if [[ -z "$OPTION" ]]
  then
    echo "1) Pull/Commit"
    echo "2) Choice Branch"
    echo "3) Merge"

    while true
    do
      printf "Escoha um numero para operar: "
      read OPTION

      if [[ "$OPTION" =~ ^[0-9]+$ ]] && (( "$OPTION" >= 1 && "$OPTION" <= 3 ))
      then
        break
      else
        echo "Numero invalido."
      fi
    done 
  fi
  
  if [[ "$OPTION" == "1" ]]
  then
    pullAndCommit
  elif [[ "$OPTION" == "2" ]]
  then
    choiceBranch
  elif [[ "$OPTION" == "3" ]]
  then
    merge
  fi
}  
  

checkDivergence  
  
if isFirstRun
then  
  echo -e "Executando script pela primeira vez.\n"
  echo -e "Instalando pacotes necessarios... \n"
  installNecessaryPackages
  clear
  
  echo -e "Realize seu acesso com username e password, para realizar as devidas configuracoes: \n"
  readUsernameAndPassword
  clear

  echo -e "Configurando email e nome, para realizacao de commits. \n"
  readEmailAndName
  clear

  git init
  git config --global core.editor "vim"
  git remote add origin $REMOTE
  git config user.email "$EMAIL"
  git config user.name "$NAME"
  clear
fi

showOptions

if ! checkSO
then
  clear
  echo "Pressione ENTER para sair."
  read
fi
