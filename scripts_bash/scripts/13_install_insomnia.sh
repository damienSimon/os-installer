#!/bin/bash
# Script installation de Insomnia sur Ubuntu 18.04

echo -e '\E[32m Installation de Insomnia en cours... \E[0m'

# Mise à jour
sudo apt update

# Installation
sudo snap install -y insomnia

echo -e '\E[32m Installation de Insomnia terminée avec succes. \E[0m'
