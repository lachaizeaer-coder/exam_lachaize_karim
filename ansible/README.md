Contexte et objectif :

Vous avez été recruté en tant qu'ingénieur DevOps dans une startup e-commerce qui souhaite créer et déployer un nouveau site web.

Après concertation avec l'équipe de développement, il a été décidé d'utiliser Prestashop pour le serveur web et MySQL pour la base de données. Votre objectif est d'automatiser ce déploiement en créant deux rôles distincts :

Un rôle pour déployer Prestashop. L'adresse suivante décrit les étapes d'installation manuelle : Guide Prestashop.
Un rôle pour déployer une base de données MySQL.
Il est essentiel que le serveur web puisse communiquer avec la base de données.

Présentation de la solution Prestashop

Prestashop est une plateforme de commerce électronique basée sur une technologie open source. Elle fournit aux commerçants en ligne un système de panier d'achat flexible, ainsi qu'un contrôle complet sur l'apparence, le contenu et les fonctionnalités de leur boutique.

Prestashop offre également des outils puissants de marketing, d'optimisation du référencement et de gestion de catalogues. Elle s'adresse aux entreprises ayant besoin d'un site e-commerce proposant de nombreux produits ou services, tout en offrant des possibilités avancées de personnalisation.

Vous trouverez la documentation officielle à cette adresse.

Vous pouvez aussi proposer à votre client une alternative si elle vous semble plus pertinente, comme Magento ou WordPress. Toute solution web répondant aux besoins exprimés sera considérée comme valide pour l'examen.

Livrables :

Pour valider l'évaluation, vous devrez envoyer sous format .zip :

Deux arborescences de rôles contenant les scripts correspondant aux besoins de l'énoncé.
Le playbook permettant d'orchestrer l'exécution de vos rôles.
Les logs des résultats de vos tests dans un fichier .txt.
Des scripts pleinement fonctionnels, quel que soit l'environnement utilisé.
Conseils pour démarrer :

Créez un utilisateur « root » pour la base de données afin que le serveur web puisse s'y connecter.
Le protocole par défaut utilisé par les serveurs web est HTTP, ouvert sur le port 80.
Le protocole de connexion MySQL est ouvert sur le port 3306 par défaut.
Pour une architecture complexe, il est recommandé de diviser la configuration en plusieurs rôles plutôt que d'écrire un seul playbook volumineux.
Prévoyez un rôle par machine et commencez par construire votre inventaire.