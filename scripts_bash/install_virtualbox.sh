#!/bin/bash
# Installation de VirtualBox sur Ubuntu 18.04.4 LTS

echo -e '\E[32m Installation de VirtualBox en cours... \E[0m'

# Création des variables d'environnement 
VERSION_VIRTUALBOX=6.1
VERSION_EXTENSION_PACK=6.1.4

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo apt update

sudo apt install virtualbox-${VERSION_VIRTUALBOX} -y



sudo wget https://download.virtualbox.org/virtualbox/${VERSION_EXTENSION_PACK}/Oracle_VM_VirtualBox_Extension_Pack-${VERSION_EXTENSION_PACK}.vbox-extpack

echo "y" | sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-${VERSION_EXTENSION_PACK}.vbox-extpack

# Suppression des fichiers temporaires
sudo rm -f Oracle_VM_VirtualBox_Extension_Pack-${VERSION_EXTENSION_PACK}.vbox-extpack
sudo rm -r /usr/temp

vboxmanage --version

echo -e '\E[32m Installation de VirtualBox terminée avec succes. \E[0m'
