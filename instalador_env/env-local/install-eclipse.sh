#!/bin/sh
# Script para:
# Instalando Eclipse
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

echo 'Instalando eclipse... ... . . . .   .  .  .'

# Apagando qualquer versao anterior do eclipse
rm -Rf /opt/eclipse/
rm -Rf /usr/share/applications/eclipse.desktop

# Baixando o eclipse
wget -c http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz

# Descompactando repositorio do programa e copiando para pasta opt
tar -zxvf eclipse.tar.gz -C /opt/

# Renomeando e movendo pasta
mv /opt/eclipse*/ /opt/eclipse

# Baixando e salvando icone do eclipse
wget https://dl2.macupdate.com/images/icons128/11662.png -O /opt/eclipse/eclipse.png

# Criando atalho (caso haja suporte no S.O. em questao)
echo -e '[Desktop Entry]\n Version=1.0\n Name=eclipse\n Exec=/opt/eclipse/eclipse\n Icon=/opt/eclipse/eclipse.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/eclipse.desktop

# Permissao para executar o eclipse
chmod +x /usr/share/applications/eclipse.desktop

# Copiando atalho para a area de trabalho
cp /usr/share/applications/eclipse.desktop  ~/Área\ de\ Trabalho/
cp /usr/share/applications/eclipse.desktop ~/Desktop

echo 'Eclipse install succefull!'