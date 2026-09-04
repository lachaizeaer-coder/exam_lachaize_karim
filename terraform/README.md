Contexte et objectif

Pour valider votre apprentissage, vous devrez construire, déployer et automatiser le déploiement d'un site web Wordpress pour une entreprise dans laquelle vous venez d'être embauché en tant qu'ingénieur DevOps.

Voici les éléments nécessaires que devra composer votre architecture :

La région utilisée est Paris (eu-west-3).
Une instance de type t3.micro pour votre serveur web où sera installé Wordpress. Votre code Terraform devra automatiquement récupérer les AMI disponibles et les zones de disponibilité correspondantes.
La base de données devra être déployée sur des instances. La ressource Terraform correspondante est aws_db_instance, de type db.t3.micro. Vous devrez la déployer dans 2 Availability Zones différentes (eu-west-3). Vous trouverez la documentation et des exemples ici : aws_db_instance.
Un disque supplémentaire EBS devra être ajouté pour la persistance, d'une taille de 10 Go. Veillez à ce que l'instance EC2 et le disque EBS appartiennent à la même zone de disponibilité.
Documentation et exemples : EBS volume.
L'accès à votre serveur web via le protocole HTTP depuis un navigateur sur le port 80.
Bonus : configurez un accès sécurisé HTTPS (port 443, TLS) à votre serveur Web.
Une fois le code Terraform prêt, vous devrez le segmenter en plusieurs modules et le déployer afin de valider son bon fonctionnement.

Votre livrable devrait avoir la structure suivante :

├── modules
│    └── networking
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
│    └── ec2
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
│    └── rds
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
│    └── ebs
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
├── variables.tf
├── main.tf
└── install_wordpress.sh
Livrable attendu
Un bon code Terraform est un code répétable et réutilisable. Le livrable devra contenir, dans un dossier zip, les templates (modules) Terraform utilisés pour construire cette architecture. Le déploiement doit fonctionner en toutes circonstances, il sera donc important de tester votre code.

Conditions de validation
L'architecture déployée doit être identique au besoin énoncé.
Aucun mot de passe ne doit apparaître en dur dans votre code (utilisation des variables).
La conception de votre architecture doit être stackée, lisible et facile à déployer (utilisation des modules).
Appliquez les bonnes pratiques vues dans ce cours pour l'utilisation de Terraform.
Utilisation du langage HCL.
Veillez à supprimer toutes les ressources créées avec Terraform, en utilisant uniquement Terraform :

terraform destroy --auto-approve
XVI - Aller plus loin : la certification HashiCorp Terraform Associate


L'examen de certification HashiCorp Terraform Associate peut aider les aspirants à valider leurs compétences en automatisation d'infrastructure avec Terraform. Vous trouverez les informations sur la certification ainsi que les modalités de passage ici.

Pré-requis : Connaissance de base de Terraform et compréhension de l'architecture cloud et sur site.

Modalités de l'examen :

Type d'évaluation : Questions à choix multiples
Durée : 1 heure
Format : surveillé en ligne
Langue : anglais
Validité : 2 ans
Terraform s'est imposé comme un outil majeur dans le processus DevOps et l'automatisation. Les organisations ont besoin de technologies robustes pour gérer leurs ressources dans différents environnements cloud et sur site, et souhaitent orchestrer leur infrastructure.
