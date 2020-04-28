#!/bin/bash

echo "Digite a URL do repositório upstream: "
read REPO_UPSTREAM

echo "Qual branch você esta?"
read CURRENT_BRANCH

echo "Deseja reeescrever o histórico da sua branch? (S ou N)"
read OVERRIDE_HISTORY

echo "|| -- CARREGANDO E EXECUTANDO COMANDOS ... -- ||"

git remote add upstream ${REPO_UPSTREAM}

git fetch upstream

git checkout ${CURRENT_BRANCH}

case "${OVERRIDE_HISTORY}" in
	s|S|"")
		git rebase upstream/${CURRENT_BRANCH}
		git push -f origin ${CURRENT_BRANCH}
		echo "|| -- FORK REALIZADO COM REESCRITA DE BRANCH REALIZADA COM SUCESSO! -- ||"
	;;
	n|N)
		git merge upstream/${CURRENT_BRANCH}
		echo "|| -- FORK REALIZADO COM SUCESSO! -- ||"
	;;
	*)
		echo "Opção invalida."
	;;
esac
