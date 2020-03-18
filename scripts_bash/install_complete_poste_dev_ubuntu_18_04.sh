#!/bin/bash
# Script global permettant l'installation complète d'un poste de dev sous Ubuntu 18.04
#sudo su
echo -e '\E[32m Installation démarrée, veuillez patienter... \E[0m'

sudo cp install_complete_poste_dev_ubuntu_18_04.sh ~/install_complete_poste_dev_ubuntu_18_04.sh
sudo cp -r ./scripts ~/scripts
cd ~/scripts

. 00_install_variables_perso.sh
echo -e '\E[32m ----------------------- \E[0m'
. 01_install_docker.sh
echo -e '\E[32m ----------------------- \E[0m'
. 02_install_docker-compose.sh
echo -e '\E[32m ----------------------- \E[0m'
. 03_install_jdk_jre_8.sh
echo -e '\E[32m ----------------------- \E[0m'
. 04_install_openjdk_13.sh
echo -e '\E[32m ----------------------- \E[0m'
. 05_install_variables_environnement_jdk.sh
echo -e '\E[32m ----------------------- \E[0m'
. 06_install_update-alternatives.sh
echo -e '\E[32m ----------------------- \E[0m'
. 07_install_maven.sh
echo -e '\E[32m ----------------------- \E[0m'
. 08_install_yarn.sh
echo -e '\E[32m ----------------------- \E[0m'
. 09_install_node_npm.sh
echo -e '\E[32m ----------------------- \E[0m'
. 10_install_git.sh
echo -e '\E[32m ----------------------- \E[0m'
. 11_install_intellij.sh
echo -e '\E[32m ----------------------- \E[0m'
. 12_install_gitkraken.sh
echo -e '\E[32m ----------------------- \E[0m'
. 13_install_insomnia.sh
echo -e '\E[32m ----------------------- \E[0m'
. 14_install_notepad-plus-plus.sh
echo -e '\E[32m ----------------------- \E[0m'
. 15_install_mattermost.sh
echo -e '\E[32m ----------------------- \E[0m'

sudo rm -f ~/install_complete_poste_dev_ubuntu_18_04.sh
sudo rm -r ~/scripts

echo -e '\E[32m Installation terminée avec succes. \E[0m'
echo -e '\E[32m Ubuntu va redémarrer dans 1 minute... \E[0m'

sudo shutdown -r +1

