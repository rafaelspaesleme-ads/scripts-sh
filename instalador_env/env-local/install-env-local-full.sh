#!/bin/sh
# Script para:
# Instalando ambiente de desenvolvimento local
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Iniciando instalacao

dialog                                          \
   --title 'INSTALADOR DE AMBIENTE DEV LOCAL'                              \
   --yesno '\nBem vindo ao instalador do ambiente do desenvolvedor.
            \nDeseja realizar instalacao do ambiente?\n\n'    \
   0 0 ; 
   
echo Retorno: $?

if [ $? = 0 ]; then

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao das bibliotecas do linux...'  \
   10 70 0; done

# Instalando linux
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-liblinux.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                     \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Google Chrome...'  \
   10 70 0; done

# Instalando Chrome
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-chrome.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                     \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do DBeaverh...'  \
   10 70 0; done

# Instalando dbeaverh
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-dbeaverh.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Eclipse...'  \
   10 70 0; done

# Instalando eclipse
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-eclipse.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Gimp...'  \
   10 70 0; done

# Instalando gimp
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-gimp.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Java...'  \
   10 70 0; done

# Instalando java
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-java.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do maven...'  \
   10 70 0; done

# Instalando maven
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-maven.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do netbeans...'  \
   10 70 0; done

# Instalando netbeans
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-netbeans.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Postman...'  \
   10 70 0; done

# Instalando postman
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-postman.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Skype...'  \
   10 70 0; done

# Instalando skype
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-skype.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Slack...'  \
   10 70 0; done

# Instalando slack
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-slack.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Spotify...'  \
   10 70 0; done

# Instalando spotify
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-spotify.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do TeamViewer...'  \
   10 70 0; done

# Instalando teamviewer
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-teamviewer.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do Tomcat...'  \
   10 70 0; done

# Instalando tomcat
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-tomcat.sh | sh

for i in $(seq 0 10 100) ; do sleep 1; echo $i | 
dialog                                        \
   --title 'INSTALANDO'        \
   --gauge '\nCarregando instalacao do VS Code...'  \
   10 70 0; done

# Instalando vscode
curl -sSL https://github.com/rafaelspaesleme-ads/scripts-sh/raw/master/instalador_env/env-local/install-vscode.sh | sh


for i in {5..1}
do
clear
dialog                                         \
   --title 'INSTALANDO'                           \
   --infobox '\nFinalizando instalacao em '$i' segundos...'  \
   0 0; sleep 1; done
dialog                                         \
   --title 'INSTALANDO'                           \
   --infobox '\nInstalacao finalizada!'  \
   0 0
else
        echo 'Procedimento cancelado.'
fi