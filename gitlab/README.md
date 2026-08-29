GitLab est largement reconnu dans l'industrie du développement logiciel pour sa configuration et son déploiement rapides, ainsi que pour l'efficacité de ses outils d'intégration et de déploiement continus (CI/CD). GitLab est une plateforme qui permet de mettre en place, de bout en bout, des pratiques DevOps pour une entreprise et contribue considérablement à l'automatisation des processus de test et de développement.

GitLab CI est le module de GitLab utilisé pour mettre en œuvre différentes pratiques continues, telles que l'intégration continue (CI), la livraison continue (CD) et le déploiement continu. GitLab CI permet de créer, tester et publier des logiciels sans nécessiter d'outils ou de services tiers.

Nous pouvons utiliser GitLab CI pour identifier les erreurs et les bogues dès le début du cycle de développement logiciel (SDLC). Il garantit ainsi la conformité de tout le code déployé en production avec les normes établies pour l'application. GitLab est de ce fait un outil incontournable dans le domaine du DevOps.

Contexte de l'examen


SkyBlue IT Limited est une entreprise de services informatiques basée à York, au Royaume-Uni. Vous avez postulé à un appel d'offres via une plateforme de prestation de services appelée Upwork, en tant qu'ingénieur DevOps. Votre candidature a été retenue et vous devez aider cette entreprise à industrialiser et automatiser l'ensemble de sa chaîne de production logicielle en utilisant GitLab.

En tant qu'ingénieur DevOps, vous serez responsable de la collaboration entre les équipes de développement et d'exploitation afin d'assurer une livraison continue et fiable des logiciels. À l'aide de GitLab CI, vous devrez automatiser les processus de construction, de test et de déploiement.

Voici quelques-unes des tâches qu'un ingénieur DevOps peut effectuer avec GitLab CI en entreprise :

Création et maintenance de pipelines CI/CD pour les projets de développement logiciel
Automatisation des tests unitaires et d'intégration
Déploiement continu de logiciels sur des environnements de production
Gestion des versions et des branches du code source
Surveillance des performances et des erreurs du système
L'application produite par les développeurs est disponible sur le dépôt GitHub examen.

Vous devez donc, pour ce projet :

Installer l'environnement de déploiement de l'application, à savoir Kubernetes. Ce cluster Kubernetes comportera 4 environnements de déploiement : dev, QA, staging et prod. Vous utiliserez le principe de Namespace afin de créer vos différents environnements.
Récupérer ce projet sur votre propre dépôt GitLab.
Configurer un compte sur DockerHub afin de stocker les différentes images produites.
Créer un projet sur la version cloud de GitLab afin de mettre en place l'automatisation des tâches.
Produire un fichier gitlab-ci.yml définissant l'ensemble des jobs à exécuter dans le pipeline.
Produire, à partir du fichier docker-compose.yml, les manifestes de déploiement de l'application dans Kubernetes, puis les charts Helm associés.
Effectuer le déploiement en production manuellement, uniquement si la branche concernée est la branche Main.
Mettre en place l'automatisation complète grâce à GitLab CI.
Les livrables :

Un fichier zip renommé au format nom_prenom_promo_année.
Ce fichier contiendra :

un fichier texte avec le lien du dépôt GitHub,
les captures des résultats au sein de GitLab CI dans un fichier PDF,
et un fichier texte contenant le lien du DockerHub, afin de vérifier l'existence des images publiées.
Attention : Vérifiez que votre dépôt GitHub/GitLab est bien accessible publiquement pour permettre la correction. Dans le cas contraire, votre travail pourrait être refusé automatiquement.
