#!/bin/bash

# Gerando chave ssh
cd ~/.ssh

ssh-keygen -t rsa -N "" -f $CREATE_PPKEY

sshpass -p "" ssh-copy-id -i ~/.ssh/$CREATE_PPKEY.pub $USER_ENV@$HOST_ENV
