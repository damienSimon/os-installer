#!/bin/bash
# Configuration des variables d'environnement des JDK sous Ubuntu 18.04.4 LTS

echo -e '\E[32m Configuration des variables environnement des JDK en cours... \E[0m'

# Vérification de la version
java -version

# Configurer l'environnement

# Copier le bloc (selon votre cas) à la fin du fichier profile et sortir en sauvegardant ('Ctrl + O puis entrée, Ctrl + X puis entrée)
# JDK 8
echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile
echo "JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> /etc/profile
echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /etc/profile
echo "export JAVA_HOME" >> /etc/profile
echo "export JRE_HOME" >> /etc/profile
echo "export PATH" >> /etc/profile

# OpenJDK 13
#echo "JAVA_HOME=/usr/java/jdk-13.0.2" >> /etc/profile
#echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /etc/profile
#echo "export JAVA_HOME" >> /etc/profile
#echo "export JRE_HOME" >> /etc/profile
#echo "export PATH" >> /etc/profile

# JDK 8 + OpenJDK 13
#echo "JAVA_HOME=/usr/java/jdk-13.0.2:/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile
#echo "JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> /etc/profile
#echo "PATH=$PATH:$HOME/bin:$JAVA_HOME/bin" >> /etc/profile
#echo "export JAVA_HOME" >> /etc/profile
#echo "export JRE_HOME" >> /etc/profile
#echo "export PATH" >> /etc/profile

# Rédémarrer Ubuntu

# Vérification de la version
java -version

echo -e '\E[32m Configuration des variables environnement des JDK terminée avec succes. \E[0m'
