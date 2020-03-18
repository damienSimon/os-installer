#!/bin/bash
# Script installation de git sur Ubuntu 18.04

echo -e '\E[32m Installation de git en cours... \E[0m'

# Mise à jour
sudo apt update

# Installation de git
sudo apt install -y git

# Vérification de la version de git
git --version

echo -e '\E[32m Installation de git terminée avec succes. \E[0m'
