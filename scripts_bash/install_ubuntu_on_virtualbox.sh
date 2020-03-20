#!/bin/bash
# Installation VM Ubuntu 18.04.4 LTS de test dans VirtualBox

echo -e '\E[32m Configuration de la VM Ubuntu de test dans VirtualBox en cours... \E[0m'

créer repertoire iso et telecharger image iso ubuntu desktop (checker si fichier présent sinon pas dupliquer les 2Go...)
creer repertoire VMs... (idem verifier si deja présent, si c est le cas demandez confirmation de suppression)

A corriger dans install auto ubuntu dans virtual box :
- user créé non root
- A changer => keyboard-configuration/layoutcode us + detectedOSLanguages en-US + language en-US + languagechooser/language-name=English
- enlever la popup"aidez nous à améliorer ubuntu après reboot"
- user login session obligatoire (voir pour le virer dans le cas de mes tests) => start-vm=headless suffit ? (possible de reboot la VM et demarrer en GUI après ?)
- modifier le script post_install pour aller lancer mes scripts sh outils?






# Definition des variables pour la VM et l'OS
NOM_VIRTUAL_MACHINE=test-vm-ubuntu-18-04
REPERTOIRE_VIRTUAL_BOX=/home/dasim/perso/outils/VirtualBox
CHEMIN_FICHIER_ISO=${REPERTOIRE_VIRTUAL_BOX}/iso/ubuntu-18.04.4-desktop-amd64.iso
CHEMIN_FICHIER_VDI=${REPERTOIRE_VIRTUAL_BOX}/VMs/${NOM_VIRTUAL_MACHINE}/${NOM_VIRTUAL_MACHINE}.vdi
SCRIPT_TEMPLATE=/home/dasim/perso/developpement/os-installer/scripts_bash/UnattendedTemplates_override/ubuntu_preseed_override.cfg
SCRIPT_TEMPLATE=/usr/lib/virtualbox/UnattendedTemplates/debian_preseed.cfg
POST_INSTALL_TEMPLATE=/usr/lib/virtualbox/UnattendedTemplates/debian_postinstall.sh
MEMOIRE_ALLOUEE_VM=8192
VRAM_ALLOUEE_VM=256
ESPACE_DISQUE_ALLOUEE_VM=30000
NB_CPU_VM=2
OS_USER=dasim
OS_PASSWORD=${OS_USER}
OS_LOCALE=fr_FR
OS_PAYS=FR
OS_KEYBOARD=fr
OS_TIMEZONE=Europe/Paris

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
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --graphicscontroller vmsvga

# Configure le lecteur CD (si besoin pour booter dessus)
VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name IDE --add ide
VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl IDE --port 0 --device 0 --type dvddrive --medium ${CHEMIN_FICHIER_ISO}

# Configuration de la mémoire et du nombre de CPU virtuel pour la VM (minimum 2)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --memory ${MEMOIRE_ALLOUEE_VM} --vram ${VRAM_ALLOUEE_VM}
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --cpus ${NB_CPU_VM}

# Configure le reseau
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --ioapic on
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --nic1 nat --nictype1 Am79C973

# Configure l'ordre pour le boot
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --boot1 dvd --boot2 disk --boot3 none --boot4 none

# Suppresion de l'audio (si VM pour effectuer des tests auto)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --audio none

# Configuration du copié / collé + drag and drop bidirectionnel
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --clipboard bidirectional
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --draganddrop bidirectional

# Installation de l'OS sur la VM (Virtual Machine Unattended)
VBoxManage unattended install ${NOM_VIRTUAL_MACHINE} --user=${OS_USER} --password=${OS_PASSWORD} --locale=${OS_LOCALE} --country=${OS_PAYS} --time-zone=${OS_TIMEZONE} --iso=${CHEMIN_FICHIER_ISO} --script-template ${SCRIPT_TEMPLATE} --post-install-template ${POST_INSTALL_TEMPLATE} --start-vm=gui

echo -e '\E[32m Installation VM Ubuntu de test dans VirtualBox en cours... Vous pouvez suivre son évolution dans la popup virtualbox qui est ouverte. \E[0m'

# Suppression de la VM
# VBoxManage unregistervm --delete ${NOM_VIRTUAL_MACHINE}
