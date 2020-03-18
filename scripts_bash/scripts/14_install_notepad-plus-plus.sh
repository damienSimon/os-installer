#!/bin/bash
# Script installation de Notepad++ sur Ubuntu 18.04

echo -e '\E[32m Installation de Notepad++ en cours... \E[0m'

# Mise à jour
sudo apt update

# Installation
sudo snap install -y notepad-plus-plus

echo -e '\E[32m Installation de Notepad++ terminée avec succes. \E[0m'
