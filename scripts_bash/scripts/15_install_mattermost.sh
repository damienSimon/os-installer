#!/bin/bash
# Script installation de Mattermost sur Ubuntu 18.04

echo -e '\E[32m Installation de Mattermost en cours... \E[0m'

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

# Récupération du paquet Mattermost v4.4
sudo wget https://releases.mattermost.com/desktop/4.4.0/mattermost-desktop-4.4.0-linux-amd64.deb

# Installation 
sudo dpkg -i mattermost-desktop-4.4.0-linux-amd64.deb

# Suppression des fichiers temporaires
sudo rm -f mattermost-desktop-4.4.0-linux-amd64.deb
sudo rm -r /usr/temp

cd ~/scripts

echo -e '\E[32m Installation de Mattermost terminée avec succes. \E[0m'
