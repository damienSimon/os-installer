#!/bin/bash

sudo apt install -y virtualbox-guest-additions-iso

sudo mkdir /media/test
sudo mount --bind /usr/share/virtualbox/VBoxGuestAdditions.iso /media
sudo mount --bind /usr/share/virtualbox/VBoxGuestAdditions.iso /media/test
#sudo mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /media
#sudo mount /usr/share/virtualbox/VBoxGuestAdditions.iso /media
#sudo mount -o loop -t iso9660 /usr/share/virtualbox/VBoxGuestAdditions.iso /media

echo "--------------------------------------------------------------------------------"
#sudo ros service enable kernel-extras
#sudo ros service up kernel-extras

sudo -i

echo "modprode nfs"
sudo modprode nfs
sudo modprode nfsd

sudo /sbin/modprode nfs
sudo /sbin/modprode nfsd

sudo exec /sbin/modprobe nfs
sudo exec /sbin/modprobe nfsd

sudo which modprobe

echo "------------------"

LOOP_DEVICE=$(sudo losetup -f) # this will print the first available loop device ex:/dev/loop0
echo "LOOP_DEVICE=$(sudo losetup -f)"
#losetup /dev/loop0 /usr/share/virtualbox/VBoxGuestAdditions.iso #associate loop0 with the specified file
sudo losetup -P $LOOP_DEVICE /usr/share/virtualbox/VBoxGuestAdditions.iso #associate loop0 with the specified file
#mount /dev/loop0 /media #It may be necessary specify the type (-t iso9660)
sudo mount -t iso9660 $LOOP_DEVICE /media #It may be necessary specify the type (-t iso9660)

sudo /media/VBoxLinuxAdditions.run
sudo /media/test/VBoxLinuxAdditions.run