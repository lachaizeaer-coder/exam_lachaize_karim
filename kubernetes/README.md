DEVOPS TRAINING 2026 Third sprint : Kubernetes x Helm x Ingress 

############### Exam Statement ###############
#
#Exercice : Déploiement d'une application avec base de données
#Contexte et objectif :
#
#Vous êtes recruté comme Ingénieur Devops au sein d'une société de services de streaming.
#
#Vous êtes chargé de déployer les nouveaux micro services qui permettront l'enregistrement et le décompte des utilisateurs présents sur cette plateforme. Pour cela, vous avez 2 micro-services à déployer :
#
#un service qui déploiera votre application FastAPI
#un second service qui déploie votre base de données PostgreSQL
#Pour la bonne réalisation de votre mission, nous vous avons préparé une feuille de route :
#
#Définir les objets Kubernetes adéquats pour un déploiement optimal des micro-services, vous avez le choix pour le type d'objet à utiliser.
#Écrire le Dockerfile pour le micro-service FastAPI. L'application est disponible sur le dépôt suivant : kubernetes-devops-project.git.
#Basez-vous sur le fichier docker-compose.yaml afin de comprendre l'architecture à déployer.
#Vous créerez votre sous-domaine sur https://cloudns.net et vous créerez un enregistrement pour votre site internet.
#Vous utiliserez la classe de stockage par défaut de Rancher (StorageClass) afin de gérer votre stockage pour votre application. Votre volume de stockage aura 10 Gi de stockage et devra permettre que plusieurs Pods #puissent écrire dessus.
#Vous définirez 3 réplicas de votre application au déploiement de celle-ci.
#Dans l'URL de connexion entre le service Fastapi et à la base de données PostgreSQL, nous avons postgresql://admin:password@db:5432/storedb. db devra donc être le nom du service Kubernetes qui expose PostgreSQL #afin que le micro-service FastAPI puisse joindre la base de données.
#Toutes les tâches devront être mises en place de la façon suivante :
#Déploiement grâce aux fichiers YAML standards de Kubernetes, pour les déployer vous utiliserez le Namespace standard.
#Livrables:
#
#Pour valider l'exercice vous devrez envoyer en format Zip :
#
#Un répertoire YAML-STANTARD avec toutes les configurations.
#
#Les fichiers de logs de vos différents micro-services (FastAPI, PostgreSQL).
#
#Un fichier de sauvegarde de votre base de données ETCD une fois toutes les configurations mise en place déployées.
#
#Quelques conseils pour vous lancer :
#
#Chaque micro-service devra être exposé via un service afin que les autres micro-services puissent se connecter sur un port spécifique.
#
#Le seul Pod avec lequel on pourra se connecter via les objets de types Ingress est celui de l'application FastAPI. Vous devrez donc créer un objet de type deployment pour le micro service FastAPI.
#
#Pour votre base de données, vous devrez utiliser un objet de type Statefulset, vous devrez également utiliser les objets de types Secrets afin de passer les éléments de configurations sensibles comme des mots de #passe et utiliser les objets de types Configmap pour tout type d'information non-sensible comme des noms d'utilisateurs et bien d'autres.
#
#Pour remplir votre base de données vous pouvez le faire sur la route /docs de votre micro-service FastAPI.
#
#Pour la liste des utilisateurs, la route est /users.
#
#Pour comptabiliser tous les utilisateurs de la plateforme, la route est /users/count.
#
#Quelques Images des services en cours d'exécution :