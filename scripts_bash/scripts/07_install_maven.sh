#!/bin/bash
# Script installation de maven sur Ubuntu 18.04

echo -e '\E[32m Installation de maven (besoin du mode root) en cours... \E[0m'

# Création d'un répertoire temporaire
sudo mkdir /usr/temp
cd /usr/temp

# Récupération de la version 3.6.3
sudo wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

# Dézippage de maven dans le dossier /opt
sudo tar xf apache-maven-3.6.3-bin.tar.gz -C /opt

# Création du lien symbolique
sudo ln -s /opt/apache-maven-3.6.3 /opt/maven

# Suppression des fichiers temporaires
sudo rm -f apache-maven-3.6.3-bin.tar.gz
sudo rm -r /usr/temp

# Configuration des variables d'environnements Maven

# Copier le bloc (selon votre cas) dans le fichier maven.sh et sortir en sauvegardant ('Ctrl + O puis entrée, Ctrl + X puis entrée)
# JDK 8
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile.d/maven.sh
sudo echo "export JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> /etc/profile.d/maven.sh
sudo echo "export M2_HOME=/opt/maven" >> /etc/profile.d/maven.sh
sudo echo "export MAVEN_HOME=/opt/maven" >> /etc/profile.d/maven.sh
sudo echo "export PATH=${M2_HOME}/bin:${PATH}:$JAVA_HOME/bin" >> /etc/profile.d/maven.sh

# OpenJDK 13
#echo "export JAVA_HOME=/usr/java/jdk-13.0.2" >> /etc/profile.d/maven.sh
#echo "export M2_HOME=/opt/maven" >> /etc/profile.d/maven.sh
#echo "export MAVEN_HOME=/opt/maven" >> /etc/profile.d/maven.sh
#echo "export PATH=${M2_HOME}/bin:${PATH}:$JAVA_HOME/bin" >> /etc/profile.d/maven.sh

# Rendre le script maven.sh executable 
sudo chmod +x /etc/profile.d/maven.sh

#Chargement des variables d'environnement maven
source /etc/profile.d/maven.sh

# Rajouter le chargement de ce fichier au démarrage
sudo echo "source /etc/profile.d/maven.sh" >> ~/.bashrc

# Redémarrer Ubuntu

# Vérification de la version
#mvn -version

cd ~/scripts

echo -e '\E[32m Installation de maven terminée avec succes. \E[0m'


