#!/bin/bash
# Script installation de GitKraken sur Ubuntu 18.04

echo -e '\E[32m Installation de GitKraken en cours... \E[0m'

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

# Récupération du paquet
sudo wget https://release.gitkraken.com/linux/gitkraken-amd64.deb

# Installation 
sudo dpkg -i gitkraken-amd64.deb

sudo apt-get -y update 
sudo apt-get install -y gconf2

sudo apt --fix-broken install -y

# Suppression des fichiers temporaires
sudo rm -f gitkraken-amd64.deb
sudo rm -r /usr/temp

# Pour configurer Gitlab, suivre le tuto https://support.gitkraken.com/integrations/gitlab-self-hosted/

cd ~/scripts

echo -e '\E[32m Installation de GitKraken terminée avec succes. \E[0m'
