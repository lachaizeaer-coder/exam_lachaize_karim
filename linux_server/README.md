DEVOPS TRAINING 2026
Second sprint : linux server - NGINX x MariaDB x Rsync x Crontab

############## Exam Statement ##############

#Exercice : création de l'environnement
#Contexte et objectif
#
#Vous êtes recruté en tant qu'administrateur sysops dans une société de services spécialisée en IT. Votre mission est de déployer et gérer l'infrastructure de production d'un site internet, selon les spécifications #suivantes :
#
#Utiliser Nginx comme serveur web.
#Installer PHP 8 et déployer la dernière version de WordPress.
#(Optionnel) Proposer une alternative à WordPress (ex. Prestashop, Magento). Cette initiative sera valorisée dans l'évaluation.
#Créer un sous-domaine sur https://cloudns.net et ajouter l'enregistrement DNS correspondant.
#Utiliser MariaDB comme SGBD et créer un utilisateur spécifique disposant des droits nécessaires sur la base de données du site (sauf le droit de suppression).
#Mettre en place un plan de sauvegarde pour le site, la base de données et les fichiers de configuration.
#Sécuriser le site à l'aide de certificats SSL, par exemple avec Let's Encrypt.
#Livrables
#
###### Vous devez fournir, sous format .zip :
#
#Les fichiers de configuration de Nginx, le fichier wp-config.php de WordPress, ainsi qu'une sauvegarde de la base MariaDB et les fichiers de logs.
#
#Une ou plusieurs captures d'écran de votre application web fonctionnelle.
#
###### Les fichiers suivants :
#
#/var/log/nginx/access.log
#/var/log/nginx/error.log
#/etc/letsencrypt/live/votre_DNS/fullchain.pem
#/etc/letsencrypt/live/votre_DNS/privkey.pem
#/etc/letsencrypt/options-ssl-nginx.conf
#/etc/letsencrypt/ssl-dhparams.pem
#Le tout devra être nommé selon la convention : exerciceadminlinux_nom_prenom
#
#Conseils pratiques
#
#Utilisez le compte root uniquement à des fins de test pour la connexion entre le serveur web et la base de données. En production, privilégiez toujours des comptes nominatifs, bien plus sécurisés.
#Le protocole par défaut des serveurs web est HTTP (port 80).
#Pour un site sécurisé via certificat SSL, le protocole HTTPS utilise le port 443.
#Le protocole de connexion par défaut de MariaDB est ouvert sur le port 3306.
