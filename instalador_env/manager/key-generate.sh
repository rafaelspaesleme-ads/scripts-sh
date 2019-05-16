#!/bin/bash

# Gerando chave ssh
ssh-keygen -t rsa -N "" -f $CREATE_PPKEY

ssh-copy-id -i ~/.ssh/$CREATE_PPKEY.pub $USER_ENV@$HOST_ENV
