#!/bin/bash
# Installation de Toolbox pour Intellij sur Ubuntu 18.04.4 LTS

echo -e '\E[32m Installation de Toolbox pour Intellij en cours... \E[0m'

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

# Téléchargement du fichier d'installation de toolbox
sudo wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.16.6319.tar.gz

# Dezippage du fichier
sudo tar -xzf jetbrains-toolbox-1.16.6319.tar.gz -C /opt

# Suppression des fichiers temporaires
sudo rm -f jetbrains-toolbox-1.16.6319.tar.gz
sudo rm -r /usr/temp

# Rendre executable toolbox
sudo chmod +x /opt/jetbrains-toolbox-1.16.6319

# Aller dans le repertoire
cd /opt/jetbrains-toolbox-1.16.6319

# Lancez toolbox
./jetbrains-toolbox

# Il ne reste plus qu'à installer manuellement Intellij IDEA Ultimate via toolbox

cd ~/scripts

echo -e '\E[32m Installation de Toolbox pour Intellij terminée avec succes. \E[0m'
