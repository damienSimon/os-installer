#!/bin/bash

# Installation VM Ubuntu 18.04.4 LTS de test dans VirtualBox
echo -e '\E[32m Suppression de la VM Ubuntu de test dans VirtualBox en cours... \E[0m'

# Definition des variables pour la VM et l'OS
. ./config/environment_variables_for_ubuntu_on_virtualbox.sh

# Suppression de la VM
VBoxManage unregistervm --delete ${NOM_VIRTUAL_MACHINE}

echo -e '\E[32m Suppression VM Ubuntu de test dans VirtualBox terminée. \E[0m'
