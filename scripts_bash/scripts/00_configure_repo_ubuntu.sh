#!/bin/bash
# Script configuration des repo ubuntu pour télécharger les paquets à la fin de l'installation sur Ubuntu 18.04

echo -e '\E[32m configuration des repo ubuntu en cours... \E[0m'

sudo rm -f /etc/apt/sources.list
sudo touch /etc/apt/sources.list
sudo cat > /etc/apt/sources.list << EOF
auto lo
iface lo inet loopback
EOF

sudo rm -f /etc/NetworkManager/NetworkManager.conf
sudo touch /etc/NetworkManager/NetworkManager.conf
sudo cat > /etc/NetworkManager/NetworkManager.conf << EOF
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=false

[device]
wifi.scan-rand-mac-address=no
EOF

sudo echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
sudo echo "nameserver 8.8.4.4" | sudo tee /etc/resolv.conf > /dev/null
sudo echo "nameserver 127.0.1.1" | sudo tee /etc/resolv.conf > /dev/null
sudo cat > /etc/resolv.conf << EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 127.0.0.1
nameserver 127.0.1.1
nameserver 10.0.12.15
EOF

sudo mkdir /etc/resolvconf/resolv.conf.d
sudo touch /etc/resolvconf/resolv.conf.d/base
sudo echo "nameserver 8.8.8.8" | sudo tee /etc/resolvconf/resolv.conf.d/base > /dev/null
sudo echo "nameserver 8.8.4.4" | sudo tee /etc/resolvconf/resolv.conf.d/base > /dev/null
sudo echo "nameserver 127.0.1.1" | sudo tee /etc/resolvconf/resolv.conf.d/base > /dev/null
sudo cat > /etc/resolvconf/resolv.conf.d/base << EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 127.0.0.1
nameserver 127.0.1.1
nameserver 10.0.12.15
EOF

sudo service network-manager restart

# Sauvegarde de l'ancienne liste des repo
sudo mv -v /etc/apt/sources.list /etc/apt/sources.bak
sudo touch /etc/apt/sources.list

cat > /etc/apt/sources.list << EOF
# deb cdrom:[Ubuntu 18.04.4 LTS _Bionic Beaver_ - Release amd64 (20200203.1)]/ bionic main restricted

# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://fr.archive.ubuntu.com/ubuntu/ bionic universe
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic universe
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates universe
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team, and may not be under a free licence. Please satisfy yourself as to
## your rights to use the software. Also, please note that software in
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://fr.archive.ubuntu.com/ubuntu/ bionic multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic multiverse
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-updates multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://fr.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src http://fr.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
# deb http://archive.canonical.com/ubuntu bionic partner
# deb-src http://archive.canonical.com/ubuntu bionic partner

deb http://security.ubuntu.com/ubuntu bionic-security main restricted
# deb-src http://security.ubuntu.com/ubuntu bionic-security main restricted
deb http://security.ubuntu.com/ubuntu bionic-security universe
# deb-src http://security.ubuntu.com/ubuntu bionic-security universe
deb http://security.ubuntu.com/ubuntu bionic-security multiverse


# TODO DASIM : Bien mettre linux/debian au lieu de linux/ubuntu sinon l'installation de docker ne marche pas
deb [arch=amd64] https://download.docker.com/linux/debian bionic stable
# deb-src [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
# deb-src http://security.ubuntu.com/ubuntu bionic-security multiverse
EOF

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove --purge && sudo apt clean

echo -e '\E[32m configuration des repo ubuntu terminée avec succes. \E[0m'
