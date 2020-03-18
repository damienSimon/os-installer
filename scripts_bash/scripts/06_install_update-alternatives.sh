#!/bin/bash
# Script installation de update-alternatives sur Ubuntu 18.04

echo -e '\E[32m Installation de update-alternatives en cours... \E[0m'

# Vérification de la version
java -version

# Configurer Java Alternatives pour JDK 8
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-8-openjdk-amd64/bin/java" 1

# Configurer Java Alternatives pour OpenJDK 13
#sudo update-alternatives --install "/usr/bin/java" "java" "/usr/java/jdk-13.0.2/bin/java" 1

# Configurer Javac Alternatives pour JDK 8
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-8-openjdk-amd64/bin/javac" 1

# Configurer Javac Alternatives pour OpenJDK 13
#sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/java/jdk-13.0.2/bin/javac" 1

# Vérification de la version
java -version

####################################################################################################################

# Les commandes suivantes ne sont nécessaires que si vous avez plusieurs JDK
# Configure Java
#sudo update-alternatives --config java

# Configure Java Compiler
#sudo update-alternatives --config javac

echo -e '\E[32m Installation de update-alternatives terminée avec succes. \E[0m'
