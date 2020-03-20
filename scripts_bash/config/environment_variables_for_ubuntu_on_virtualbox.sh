#!/bin/bash

# Variables d'environnement pour l'installation VM Ubuntu 18.04.4 LTS de test dans VirtualBox

NOM_VIRTUAL_MACHINE="test-vm-ubuntu-18-04"
REPERTOIRE_VIRTUAL_BOX="/home/dasim/perso/outils/VirtualBox"
CHEMIN_FICHIER_ISO="${REPERTOIRE_VIRTUAL_BOX}/iso/ubuntu-18.04.4-desktop-amd64.iso"
CHEMIN_FICHIER_VDI="${REPERTOIRE_VIRTUAL_BOX}/VMs/${NOM_VIRTUAL_MACHINE}/${NOM_VIRTUAL_MACHINE}.vdi"
SCRIPT_TEMPLATE="/home/dasim/perso/developpement/os-installer/scripts_bash/UnattendedTemplates_override/ubuntu_preseed_override.cfg"
POST_INSTALL_TEMPLATE="/usr/lib/virtualbox/UnattendedTemplates/debian_postinstall.sh"
MEMOIRE_ALLOUEE_VM="8192"
VRAM_ALLOUEE_VM="256"
ESPACE_DISQUE_ALLOUEE_VM="30000"
NB_CPU_VM="2"
OS_USER="dasim"
OS_PASSWORD="${OS_USER}"
OS_LANGUAGE="fr_FR"
OS_LOCALE="${OS_LANGUAGE}"
OS_PAYS="FR"
OS_KEYBOARD="fr"
OS_TIMEZONE="Europe/Paris"