#!/bin/sh

chmod -R 777 DevOps/

# touch id_rsa.pub

# chmod 777 id_rsa.pub

# echo "${PUBLIC_KEY}" >> id_rsa.pub

scp -i /var/jenkins_home/.ssh/$CREATE_PPKEY DevOps/ $USER_ENV@$HOST_ENV:/$USER
