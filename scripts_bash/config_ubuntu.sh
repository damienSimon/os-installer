#!/bin/bash
# Script global permettant la configuration d'un poste de dev sous Ubuntu 18.04
#sudo su
echo -e '\E[32m Configuration démarrée, veuillez patienter... \E[0m'

sudo cp config_ubuntu.sh ~/config_ubuntu.sh
sudo cp -r ./scripts ~/scripts
cd ~/scripts

echo -e '\E[32m ----------------------- \E[0m'
. 101_configure_git.sh
echo -e '\E[32m ----------------------- \E[0m'
. 102_configure_maven_nexus_npm_registry.sh

sudo rm -f ~/config_ubuntu.sh
sudo rm -r ~/scripts

echo -e '\E[32m Configuration terminée avec succes. \E[0m'
echo -e '\E[32m Ubuntu va redémarrer dans 1 minute... \E[0m'

sudo shutdown -r +1
