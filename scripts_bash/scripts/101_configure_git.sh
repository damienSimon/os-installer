#!/bin/bash
# Script de configuration de git sur Ubuntu 18.04

echo -e '\E[32m Configuration de git en cours... \E[0m'

# Configuration de l'utilisateur
git config --global user.name ${NOM_PRENOM_PERSO}
git config --global user.email ${EMAIL_PERSO}

# Vérification des infos
git config --list

# Création du répertoire ssh
mkdir -p ~/.ssh/repo_git

# Application des droits
chmod -R 700 ~/.ssh

# Génération de la clé ssh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/repo_git/id_rsa

# Création des liens
ln -s ~/.ssh/repo_git/id_rsa ~/.ssh
ln -s ~/.ssh/repo_git/id_rsa.pub ~/.ssh
ssh-add ~/.ssh/repo_git/id_rsa

# Mise à jour du fichier de config
cat >> ~/.ssh/config << EOF
Host repo_git
    HostName repo_git
    User git
    IdentityFile ~/.ssh/repo_git/id_rsa
EOF

# Application des droits
chmod 600 ~/.ssh/config

# Aller copier manuellement la clé id_rsa.pub dans votre compte Gitlab et enregistrer

# Vérification de la connexion ssh avec Gitlab
#ssh -T repo_git

echo -e '\E[32m Configuration de git terminée avec succes. \E[0m'
