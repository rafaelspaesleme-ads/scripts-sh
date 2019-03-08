#!/bin/sh
# Script para montagem de ambiente de integração continua
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Bruno Tecno, update per Rafael Paes Leme

# Instalando o JAVA ORACLE 8 e 7 e setando o 8 como padrão;
# O script aceita os termos da Oracle automaticamente
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
echo oracle-java8-set-default shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install oracle-java8-set-default -y
apt-get install oracle-java7-installer -y

#Instalando o MAVEN 3 na versão 3.6.0
wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar -zxvf  apache-maven-3.6.0-bin.tar.gz
mv  apache-maven-3.6.0/ /opt/
rm  apache-maven-3.6.0-bin.tar.gz
echo "export M3_HOME=/opt/ apache-maven-3.6.0" >> ~/.bashrc
echo "export M3=\$M3_HOME/bin" >> ~/.bashrc
echo "export PATH=\$M3:\$PATH" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

source ~/.bashrc

# Instalando o Apache Tomcat7
apt-get install tomcat7 -y
service tomcat7 start

echo "grant codebase \"file:/var/lib/tomcat7/webapps/jenkins/-\" {" >> /etc/tomcat7/policy.d/04webapps.policy
echo "	permission java.security.Allpermission;" >> /etc/tomcat7/policy.d/04webapps.policy
echo "};" >> /etc/tomcat7/policy.d/04webapps.policy

# ---- Criando pasta de trabalho do Jenkins e dando permissao
mkdir /opt/jenkins_home
chmod 777 /opt/jenkins_home/
echo "CATALINA_OPTS=\"-DJENKINS_HOME=/opt/jenkins_home/\"" >> /etc/default/tomcat7

# Fazendo deploy do Jenkins no Tomcat
wget http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war
cp jenkins.war /var/lib/tomcat7/webapps/
service tomcat7 restart


######### Instalando o cliente Git #########
apt-get install git -y

# Instalando e configurando as dependências do Gitlab
apt-get install curl openssh-server ca-certificates postfix -y

# Adicionando os pacotes do Gitlab Server e instalando o serviço
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
apt-get install gitlab-ce -y

# Configurando e iniciando o Gitlab
gitlab-ctl reconfigure