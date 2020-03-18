#!/bin/bash
# Installation VM Ubuntu de test sur VirtualBox sur Ubuntu 18.04.4 LTS

echo -e '\E[32m Installation VM Ubuntu de test sur VirtualBox en cours... \E[0m'

# Definition des variables pour la VM et l'OS
NOM_VIRTUAL_MACHINE=test-vm-ubuntu-18-04
REPERTOIRE_VIRTUAL_BOX=/home/dasim/VirtualBox/
CHEMIN_FICHIER_ISO=/home/dasim/perso/developpement/iso/ubuntu-18.04.4-desktop-amd64.iso
CHEMIN_FICHIER_VDI=/home/dasim/perso/developpement/VMs/${NOM_VIRTUAL_MACHINE}/${NOM_VIRTUAL_MACHINE}.vdi
MEMOIRE_ALLOUEE_VM=4096
VRAM_ALLOUEE_VM=128
ESPACE_DISQUE_ALLOUEE_VM=30000
NB_CPU_VM=2
OS_USER=dasim
OS_PASSWORD=dasim
OS_PAYS=FR
OS_TIMEZONE=Europe/Paris
#OS_HOSTNAME=server01.example.com

# Creation de la VM
VBoxManage createvm --name ${NOM_VIRTUAL_MACHINE} --ostype Ubuntu_64 --register

# Configuration du stockage
VBoxManage createmedium --filename ${REPERTOIRE_VIRTUAL_BOX} ${CHEMIN_FICHIER_VDI} --size ${ESPACE_DISQUE_ALLOUEE_VM}

# Configuration du controller IDE et SATA
VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name SATA --add SATA --controller IntelAhci
VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl SATA --port 0 --device 0 --type hdd --medium ${REPERTOIRE_VIRTUAL_BOX} ${CHEMIN_FICHIER_VDI}

# Configure le lecteur CD (si besoin pour booter dessus)
VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name IDE --add ide
VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl IDE --port 0 --device 0 --type dvddrive --medium ${CHEMIN_FICHIER_ISO}

# Configuration de la mémoire et du réseau
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --memory ${MEMOIRE_ALLOUEE_VM} --vram ${VRAM_ALLOUEE_VM}
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --ioapic on

# Configure l'ordre pour le boot
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --boot1 disk --boot2 dvd --boot3 none --boot4 none

# Configure le nombre de CPU virtuel pour la VM (minimum 2)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --cpus ${NB_CPU_VM}

# Suppresion de l'audio (si VM pour effectuer des tests auto)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --audio none

# Configure les controllers USB (les désactive si VM pour effectuer des tests auto)
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --usb off
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --usbehci off
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --usbxhci off

# Configure le reseau
VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --nic1 bridged --bridgeadapter1 wlan0 --nic2 nat

# Installation de l'OS sur la VM (Virtual Machine Unattended)
VBoxManage unattended install ${NOM_VIRTUAL_MACHINE} --user=${OS_USER} --password=${OS_PASSWORD}--country=${OS_PAYS} --time-zone=${OS_TIMEZONE} --iso=${CHEMIN_FICHIER_ISO} --start-vm=gui
#--hostname=${OS_HOSTNAME}

echo -e '\E[32m Installation VM Ubuntu de test sur VirtualBox terminée avec succes. \E[0m'

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Definition des variables pour la VM et l'OS
#REPERTOIRE_BASE=pwd

# Creation de la VM
#VBoxManage createvm --name ${NOM_VIRTUAL_MACHINE} --ostype Ubuntu_64 --register --basefolder ${REPERTOIRE_BASE}

# Configuration de la mémoire et du réseau
:;#VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --ioapic on                     
#VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --memory ${MEMOIRE_ALLOUEE_VM} --vram ${VRAM_ALLOUEE_VM}       
#VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --nic1 nat

# Configuration du stockage et du boot ISO
#VBoxManage createhd --filename ${REPERTOIRE_BASE}/${NOM_VIRTUAL_MACHINE}/${NOM_VIRTUAL_MACHINE}_DISK.vdi --size ${ESPACE_DISQUE_ALLOUEE_VM} --format VDI                     
#VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name "SATA Controller" --add sata --controller IntelAhci       
#VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  ${REPERTOIRE_BASE}/${NOM_VIRTUAL_MACHINE}/${NOM_VIRTUAL_MACHINE}_DISK.vdi                
#VBoxManage storagectl ${NOM_VIRTUAL_MACHINE} --name "IDE Controller" --add ide --controller PIIX4       
#VBoxManage storageattach ${NOM_VIRTUAL_MACHINE} --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium ${REPERTOIRE_BASE}/debian.iso       
#VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --boot1 dvd --boot2 disk --boot3 none --boot4 none 

# Configuration de l'accès RDP 
#VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --vrde on                  
#VBoxManage modifyvm ${NOM_VIRTUAL_MACHINE} --vrdemulticon on --vrdeport 10001

# Démarrage de la VM
#VBoxHeadless --startvm ${NOM_VIRTUAL_MACHINE} 

