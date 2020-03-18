#!/bin/bash
# Script installation de minikube sur Ubuntu 18.04

echo -e '\E[32m Installation de minikube en cours... \E[0m'

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

# Mise à jour
sudo apt-get update

#Installation d'un paquet htpps
sudo apt-get install -y apt-transport-https

# Ajout du repository
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#sudo touch /etc/apt/sources.list.d/kubernetes.list 
#echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# Mise à jour
#sudo apt-get update

# Téléchargement de kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

# Rendre executable le binaire
chmod +x ./kubectl

# Déplacer kubectl 
sudo mv ./kubectl /usr/local/bin/kubectl

# Installation de minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

# Rendre executable minikube
chmod +x minikube 

# Déplacer dans le bon répertoire
sudo cp minikube /usr/local/bin

# Suppression des fichiers temporaires
sudo rm -f minikube
sudo rm -r /usr/temp

# Si vous lancez minikube à partir de virtualbox, vérifier sur votre VM que dans les paramètres, vous avez :
# Système/Processeur : nombre de processeurs à 2 au moins
# Système/Processeur : activer PAE/NX activé (voir si besoin) 

# Démarrage (selon votre cas)
# Si vous êtes sur une VM via VirtualBox :
minikube start --vm-driver=none
minikube config set vm-driver virtualbox
kubectl config use-context minikube

# Si vous êtes directement sur l'OS :
minikube start

# vérification de la version
kubectl cluster-info
minikube version

cd ~/scripts

echo -e '\E[32m Installation de minikube terminée avec succes. \E[0m'
