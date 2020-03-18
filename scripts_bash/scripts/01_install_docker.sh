#!/bin/bash
# Script installation de docker sur Ubuntu 18.04

echo -e '\E[32m Installation de docker en cours... \E[0m'

# Mise à jour
sudo apt-get update

# Suppression des anciennes versions de Docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# Installation de Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -	
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Check de la version installée
docker --version

# Ajout d'un groupe docker pour les permissions (peut être déjà ok)
sudo groupadd docker

# Ajout de l'utilisateur session dans le groupe
sudo usermod -aG docker $USER

# Redémarrer docker
sudo systemctl restart docker

# Modification des droits par defaut (à faire après restart)
sudo chmod 666 /var/run/docker.sock

# Vérification 
docker run hello-world

echo -e '\E[32m Installation de docker terminée avec succes. \E[0m'
