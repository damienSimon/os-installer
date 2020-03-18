#!/bin/bash
# Script installation de yarn sur Ubuntu 18.04

echo -e '\E[32m Installation de yarn en cours... \E[0m'

# Ajout du repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Mise à jour et installation
sudo apt update && sudo apt install -y yarn

# Vérification de la version
yarn --version

echo -e '\E[32m Installation de yarn terminée avec succes. \E[0m'
