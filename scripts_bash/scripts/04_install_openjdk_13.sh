#!/bin/bash
# Script installation de java 13 sur Ubuntu 18.04

echo -e '\E[32m Installation de java 13 en cours... \E[0m'

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

# Télécharger le fichier tar.gz de Linux/*64 sur le site http://jdk.java.net/13/
sudo wget https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz

# Création du répertoire java
sudo mkdir /usr/java
cd /usr/java

# Copie du fichier 
sudo cp /usr/temp/openjdk-13.0.2_linux-x64_bin.tar.gz openjdk-13.0.2_linux-x64_bin.tar.gz

# Dézippage du fichier
sudo tar -xzvf openjdk-13.0.2_linux-x64_bin.tar.gz

# Suppression des fichiers temporaires
sudo rm -f openjdk-13.0.2_linux-x64_bin.tar.gz
sudo rm -f /usr/temp/openjdk-13.0.2_linux-x64_bin.tar.gz
sudo rm -r /usr/temp

cd ~/scripts

echo -e '\E[32m Installation de java 13 terminée avec succes. \E[0m'
