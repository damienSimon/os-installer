#!/bin/bash

# Installation VM Ubuntu 18.04.4 LTS de test dans VirtualBox
echo -e '\E[32m Configuration de la VM Ubuntu de test dans VirtualBox en cours... \E[0m'

# Configuration restante à faire
#- créer repertoire iso et telecharger image iso ubuntu desktop (checker si fichier présent sinon pas dupliquer les 2Go...)
#- creer repertoire VMs... (idem verifier si deja présent, si c est le cas demandez confirmation de suppression)

# Definition des variables pour la VM et l'OS
. ./config/environment_variables_for_ubuntu_on_virtualbox.sh

# Creation de la VM
VBoxManage createvm --name ${NOM_VIRTUAL_MACHINE} --ostype Ubuntu_64 --register

# Configuration du stockage
VBoxManage createmedium --filename ${CHEMIN_FICHIER_VDI} --size ${ESPACE_DISQUE_ALLOUEE_VM}

# Configuration du controller IDE et SATA
VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name SATA --add SATA --controller IntelAhci
VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl SATA --port 0 --device 0 --type hdd --medium ${CHEMIN_FICHIER_VDI}

# Configure les controllers USB (les désactive si VM pour effectuer des tests auto)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --usb off
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --usbehci off
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --usbxhci off

# Configuration du controller graphique
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --graphicscontroller vboxsvga
VBoxManage setextradata ${NOM_VIRTUAL_MACHINE} GUI/ScaleFactor 1.6

# Configure le lecteur CD (si besoin pour booter dessus)
VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name IDE --add ide
VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl IDE --port 0 --device 0 --type dvddrive --medium ${CHEMIN_FICHIER_ISO}

# Configuration de la mémoire et du nombre de CPU virtuel pour la VM (minimum 2)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --memory ${MEMOIRE_ALLOUEE_VM} --vram ${VRAM_ALLOUEE_VM}
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --cpus ${NB_CPU_VM}

# Configure le reseau
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --ioapic on
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --nic1 bridged --bridgeadapter1 enx0050b6a74df2 --nictype1 Am79C973 --nicpromisc1 allow-vms --cableconnected1 on

# Configure l'ordre pour le boot
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --boot1 dvd --boot2 disk --boot3 none --boot4 none

# Suppresion de l'audio (si VM pour effectuer des tests auto)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --audio none

# Configuration du copié / collé + drag and drop bidirectionnel
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --clipboard bidirectional
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --draganddrop bidirectional

# Installation de l'OS sur la VM (Virtual Machine Unattended)
VBoxManage unattended install ${NOM_VIRTUAL_MACHINE} --user=${OS_USER} --password=${OS_PASSWORD} --locale=${OS_LOCALE} --language=${OS_LANGUAGE} --country=${OS_PAYS} --time-zone=${OS_TIMEZONE} --iso=${CHEMIN_FICHIER_ISO} --script-template ${SCRIPT_TEMPLATE} --post-install-template ${POST_INSTALL_TEMPLATE} --start-vm=gui

echo -e '\E[32m Installation VM Ubuntu de test dans VirtualBox en cours... \E[0m'
echo -e '\E[32m Vous pouvez suivre son évolution dans la popup virtualbox qui est ouverte. \E[0m'
