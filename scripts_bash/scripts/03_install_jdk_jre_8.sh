#!/bin/bash
# Script installation de java 8 sur Ubuntu 18.04

echo -e '\E[32m Installation de java 8 en cours... \E[0m'

# Mise à jour
sudo apt update

# Installation des paquets
sudo apt install -y openjdk-8-jdk openjdk-8-jre

# Vérification de la version
java -version

echo -e '\E[32m Installation de java 8 terminée avec succes. \E[0m'
