#!/bin/sh
# Script para:
# Cluster MongoDB + Docker: Dockerizando banco de dados MongoDB completo
# Execute esse script como root
# Executado num ambiente Debian 8 com 2048 MB de memória;
# Create per Rafael Paes Leme

# diretório no host onde será persistido os dados do banco:
mkdir /opt/mongo
mkdir /opt/mongo/data

apt install openssl

# gerando chave para garantir que os dados ira trafegar de forma segura
openssl rand -base64 741 > mongodb-keyfile $ chmod 600 mongodb-keyfile $ chown 999 mongodb-keyfile

# Subindo container
docker run --name mongo -v /opt/mongo/data:/data/db -v /opt/mongo:/opt/keyfile --hostname="node1" -p 27017:27017 -d mongo:2.6.5 --smallfiles

# Configurando mongo
senha_admin=$( dialog --title 'User MongoDB' --stdout --inputbox 'Digite a senha para (user admin):' 0 0 )

senha_root=$( dialog --title 'User MongoDB' --stdout --inputbox 'Digite a senha para (user root):' 0 0 )

docker exec -it mongo /bin/bash
mongo
use admin
db.createUser( {
     user: "admin",
     pwd: "$senha_admin",
     roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
   });
db.createUser( {
     user: "root",
     pwd: "$senha_root",
     roles: [ { role: "root", db: "admin" } ]
   });
exit
exit   

# Removendo container para subir ambiente completo
docker stop mongo
docker rm mongo

# Subindo ambiente
docker run --name mongo -v /etc/hosts:/etc/hosts -v /opt/mongo/data:/data/db -v /opt/mongo:/opt/keyfile --hostname="node1" --add-host node1.db:${node1} --add-host node2.db:${node2} --add-host node3.db:${node3} -p 27017:27017 -d mongo:2.6.5 --smallfiles --keyFile /opt/keyfile/mongodb-keyfile --replSet "rs0"

# Inicializando cluster dockerizado do mongoDB
docker exec -it mongo /bin/bash
mongo
use admin
db.auth("root", "$senha_root");
rs.initiate()
{
         "info2" : "no configuration explicitly specified -- making one",
         "me" : "node1.db:27017",
         "info" : "Config now saved locally.  Should come online in about a minute.",
         "ok" : 1
}
rs0:PRIMARY> rs.conf()
{
        "_id" : "rs0",
        "version" : 1,r
        "members" : [
              {
                  "_id" : 0,
                  "host" : "node1.db:27017"
              }
        ]
}
exit
exit

# Subindo server 2
docker run --name mongo -v /etc/hosts:/etc/hosts -v /opt/mongo/data:/data/db -v /opt/mongo:/opt/keyfile --hostname="node2" -p 27017:27017 -d mongo:2.6.5 --smallfiles --keyFile /opt/keyfile/mongodb-keyfile --replSet "rs0"

# Subindo server 3
docker run --name mongo -v /etc/hosts:/etc/hosts -v /opt/mongo/data:/data/db -v /opt/mongo:/opt/keyfile --hostname="node3" -p 27017:27017 -d mongo:2.6.5 --smallfiles --keyFile /opt/keyfile/mongodb-keyfile --replSet "rs0"

# Acessando container do server 1
docker exec -it mongo /bin/bash
mongo
use admin
db.auth("root", "$senha_root");
rs0:PRIMARY> rs.add("node2.db") 
rs0:PRIMARY> rs.add("node3.db") 
rs0:PRIMARY> rs.status()
exit
exit