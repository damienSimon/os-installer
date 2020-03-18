#!/bin/bash
# Script installation de Node et NPM sur Ubuntu 18.04

echo -e '\E[32m Installation de Node et NPM en cours... \E[0m'

# Installation de nodeJS v12 et NPM v6
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Yarn en mode global
sudo npm i --force -g yarn

echo -e '\E[32m Installation de Node et NPM terminée avec succes. \E[0m'
