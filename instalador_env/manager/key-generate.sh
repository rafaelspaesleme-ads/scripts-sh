#!/bin/bash

# Gerando chave ssh
cd /var/jenkins_home/.ssh

ssh-keygen -t rsa -N "" -f $CREATE_PPKEY

ssh-copy-id -i /var/jenkins_home/.ssh/$CREATE_PPKEY.pub $USER_ENV@$HOST_ENV
