#!/bin/bash

START_TIME_ISO=$(date +%s)

echo -e "\E[32m Création d'un iso personnalisé cours... \E[0m"

# Definition des variables pour la VM et l'OS
#. ./config/environment_variables_for_ubuntu_on_virtualbox.sh
. ./scripts/functions.sh

rm -f /home/dasim/perso/outils/VirtualBox/iso/test_dasim_iso_perso1.iso

#sudo apt-get install mkisofs
sudo mkdir /tmp/dasim_iso
cd /tmp/dasim_iso/
sudo mkdir /tmp/iso_ubuntu
sudo mount -t iso9660 -o loop /home/dasim/perso/outils/VirtualBox/iso/ubuntu-18.04.4-desktop-amd64.iso /tmp/iso_ubuntu/
cd /tmp/iso_ubuntu/
sudo tar cf - . | (cd /tmp/dasim_iso; sudo tar xfp -)
sudo cp -r /home/dasim/perso/developpement/os-installer/scripts_bash /tmp/dasim_iso/install/
sudo mkdir /tmp/guest-additions
sudo mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /tmp/guest-additions
sudo cp -r /tmp/guest-additions /tmp/dasim_iso/install/
cd /tmp/dasim_iso
sudo mkisofs -o test_dasim_iso_perso1.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V "ISO perso dasim" .
cp /tmp/dasim_iso/test_dasim_iso_perso1.iso /home/dasim/perso/outils/VirtualBox/iso/test_dasim_iso_perso1.iso

sudo rm -r /tmp/dasim_iso
sudo umount /tmp/iso_ubuntu
sudo rm -r /tmp/iso_ubuntu
sudo umount /tmp/guest-additions
sudo rm -r /tmp/guest-additions



ISO_CREATED=$(date +%s)
echo -e "\E[32m Fin de la création de l'iso personnalisé en $(extract_minutes_secondes_from_duration $START_TIME_ISO $ISO_CREATED). \E[0m"