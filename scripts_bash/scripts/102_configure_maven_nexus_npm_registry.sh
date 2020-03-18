#!/bin/bash
# Script configuration de maven sur Ubuntu 18.04

echo -e '\E[32m Configuration de maven en cours... \E[0m'

 M2_PASSWORD_TEMPORAIRE=${MAVEN_PASSWORD_PERSO]}

# Laisser l'espace au début de la commande pour ne pas historiser la commande
 M2_MASTER_PASSWORD=$(mvn -emp $M2_PASSWORD_TEMPORAIRE)
 
 # Création du repo m2
mkdir ~/.m2

# Création du fichier settings-security.xml
cat > ~/.m2/settings-security.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
 
<settingsSecurity>
    <master>$M2_MASTER_PASSWORD</master>
</settingsSecurity>
EOF

M2_LDAP_USERNAME=${LDAP_LOGIN_PERSO}
LDAP_PASSWORD_TEMPORAIRE=${LDAP_PASSWORD_PERSO}

# Génération du mot de passe chiffré pour se connecter au Nexus (bien laisser l'espace au début de la commande pour ne pas historiser la commande)
 M2_LDAP_PASSWORD=$(mvn -ep $LDAP_PASSWORD_TEMPORAIRE)
 
# Création du fichier settings.xml 
cat > ~/.m2/settings.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
 
<!-- Ensemble des paramètres maven pour RCA -->
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
 
    <!-- Login sur le serveur NEXUS -->
    <servers>
        <server>
            <id>nexus</id>
            <username>$M2_LDAP_USERNAME</username>
            <password>$M2_LDAP_PASSWORD</password>
        </server>
        <server>
            <id>snapshots</id>
            <username>$M2_LDAP_USERNAME</username>
            <password>$M2_LDAP_PASSWORD</password>
        </server>
        <server>
            <id>releases</id>
            <username>$M2_LDAP_USERNAME</username>
            <password>$M2_LDAP_PASSWORD</password>
        </server>
    </servers>
 
    <!-- Miroir pour la gestion des dépendances-->
    <mirrors>
        <mirror>
            <id>nexus</id>
            <mirrorOf>*</mirrorOf>
            <url>https://nexus.int.rcacloud.it/repository/maven-public/</url>
        </mirror>
    </mirrors>
 
    <profiles>
        <profile>
            <id>nexus</id>
 
            <!-- Enable snapshots for the built in central repo to direct -->
            <!-- all requests to nexus via the mirror -->
            <repositories>
                <repository>
                    <id>central</id>
                    <url>http://central</url>
                    <releases>
                        <enabled>true</enabled>
                    </releases>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                </repository>
            </repositories>
 
            <pluginRepositories>
                <pluginRepository>
                    <id>central</id>
                    <url>http://central</url>
                    <releases>
                        <enabled>true</enabled>
                    </releases>
                    <snapshots>
                        <enabled>true</enabled>
                    </snapshots>
                </pluginRepository>
            </pluginRepositories>
        </profile>
    </profiles>
 
    <activeProfiles>
        <!-- make the profile active all the time -->
        <activeProfile>nexus</activeProfile>
    </activeProfiles>
</settings>
EOF

# Ajout du registry à NPM
npm config set registry https://nexus.int.rcacloud.it/repository/npm-all/

# Génération de la clé d'authentification (remplacer [LOGIN] et [PWD] par ceux de votre session 
 LOGIN_PASSWORD_NPM_CONCATENE_PERSO="${LDAP_LOGIN_PERSO}:${LDAP_PASSWORD_PERSO}"
CLE_GENEREE_NPM=$(echo -n '${LOGIN_PASSWORD_NPM_CONCATENE_PERSO}' | openssl base64)

# Ajout de la clé dans le registry NPM (remplacer [CLE_GENEREE] par la clé générée précédement)
npm config set _auth $CLE_GENEREE_NPM

# Ajout de votre email (remplacer [EMAIL] par votre email)
npm config set email ${EMAIL_PERSO}

# Modifier la configuration pour invoquer systèmatiquement l'authentification
npm config set always-auth true

echo -e '\E[32m Configuration de maven terminée avec succes. \E[0m'
