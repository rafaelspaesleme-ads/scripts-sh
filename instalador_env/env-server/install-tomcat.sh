#!/bin/sh
# Script para:
# Instalacao do apache Tomcat
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# Instalando o Apache Tomcat7
echo '+========================================================+'
echo '=== = =                                            = = ==='
echo '=                     Instalando Tomcat                  ='
echo '=== = =                                            = = ==='
echo '+========================================================+'

apt-get install tomcat7 -y
service tomcat7 start

echo "grant codebase \"file:/var/lib/tomcat7/webapps/jenkins/-\" {" >> /etc/tomcat7/policy.d/04webapps.policy
echo "	permission java.security.Allpermission;" >> /etc/tomcat7/policy.d/04webapps.policy
echo "};" >> /etc/tomcat7/policy.d/04webapps.policy