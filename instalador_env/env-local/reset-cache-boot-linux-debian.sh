#!/bin/bash


# Removendo pacotes inuteis
sudo apt-get autoremove

# Removendo itens temporarios
sudo apt-get clean

# Removendo pacotes antigos de kernel
sudo apt-get purge $(dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve "$(uname -r | sed -r 's/-[a-z]+//')")
