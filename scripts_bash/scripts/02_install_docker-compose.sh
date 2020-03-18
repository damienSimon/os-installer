#!/bin/bash
# Script installation de docker-compose sur Ubuntu 18.04

echo -e '\E[32m Installation de docker-compose en cours... \E[0m'

# Installation de docker-compose 1.25.4
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Ajout des droits à docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Check de la version installée
docker-compose --version

echo -e '\E[32m Installation de docker-compose terminée avec succes. \E[0m'
