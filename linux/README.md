DEVOPS TRAINING 2026 
First sprint : linux bash

########### Exam Statement ###########

#Exercice à réaliser obligatoirement sur la machine Linux mise à votre disposition.
#Connectez vous à votre machine et exécutez la commande suivante pour récupérer l'api
#
#wget --no-cache https://dst-de.s3.eu-west-3.amazonaws.com/bash_fr/api.tar
#Vous avez maintenant un fichier d'extension .tar. Il s'agit simplement d'une archive à la manière d'un fichier compressé zip, mais spécifique à Linux. Pour manipuler ce fichier, nous passons par la commande tar (pour #_tape archiver_). Pour tous les formats à base de tar, vous verrez que les options de tar sont les mêmes :
#
#c : crée l'archive
#x : extrait l'archive
#f : utilise le fichier donné en paramètre
#v : active le mode verbeux.
#Décompressez l'archive à l'aide de la commande suivante :
#
#tar xvf api.tar
#L'extrait de l'archive vous dévoile le script _api_
#
#Lancez le script api après avoir donné les droits d'exécution :
#
#chmod +x api
#./api
#Notre API tourne maintenant en localhost (127.0.0.1) sur le port 5000.
#
#Contexte de l'exercice
#Cette API nous dévoile les ventes par minutes du plus gros revendeurs de cartes graphiques sur les modèles rtx3060, rtx3070, rtx3080, rtx3090 et rx6700. Il est possible de récupérer ces informations à l'aide de la #commande cURL. Toutefois, il se peut que vous n'ayez pas cURL sur votre machine, pour remédier à cela, nous utilisons apt sur Linux.
#
#Commande apt
#apt est un gestionnaire de paquets qui contiennent différents logiciels que vous pouvez installer assez facilement avec une seule ligne de code. Pour ce faire, nous pouvons faire comme suit :
#
#apt install software_name
#Dans les anciennes versions d'Ubuntu, vous aviez besoin d'utiliser apt-get au lieu de apt. Dans la plupart des cas, vous avez besoin de sudo pour forcer les droits d'installation d'un logiciel.
#
#Pour vous assurer que les paquets sont à jour, vous pouvez utiliser sudo apt update . Pour mettre à jour les logiciels, vous pouvez utiliser sudo apt upgrade . Vous pouvez ajouter ou supprimer certains paquets et #supprimer complètement un logiciel utilisant la fonction apt purge.
#
#Installez curl avec apt.
#
#sudo apt-get update
#
#sudo apt-get install curl
#Maintenant que nous avons curl, expliquons l'outil.
#
#Commande curl
#cURL, qui signifie client URL est un outil de ligne de commande pour le transfert de fichiers avec une syntaxe URL. Il prend en charge un certain nombre de protocoles (HTTP, HTTPS, FTP, et bien d'autres). HTTP/HTTPS en #fait un excellent candidat pour interagir avec les APIs.
#
#On peut par exemple récupérer les ventes de rtx3060 a l'aide de la commande suivante.
#
#curl "http://0.0.0.0:5000/rtx3060"
#Créez un dossier exam_NOM ou NOM est votre nom de famille.
#
#Créez à l'intérieur du dossier un script bash nommé exam.sh dont les droits d’exécution sont -rwx---r-x.
#
#Le script bash devra récupérer les chiffres correspondant au ventes des différentes carte graphique et écrire les information dans un fichier sales.txt sous la forme :
#
#Date de scraping
#rtx3060:Nb de vente
#rtx3070:Nb de vente
#...
#
#Voici un exemple de fichier sales.txt:
#
#Thu Apr  1 00:05:01 UTC 2021
#rtx3060:18
#rtx3070:20
#rtx3080:20
#rtx3090:2
#rx6700:12
#Thu Apr  1 00:06:01 UTC 2021
#rtx3060:6
#rtx3070:15
#rtx3080:15
#rtx3090:1
#rx6700:15
#...
#...
#Pour récupérer la date actuelle et l'écrire dans le fichier, introduisez la ligne suivante dans votre examen:
#
#echo "$(date)" >> sales.txt
#Contrainte : utilisation d'une fonction et d'une boucle (for ou while) obligatoire.
#
#Créez un Cron Job qui exécute votre script toutes les minutes de 7 heures à 21 heures durant les mois de Mars, Juin et Novembre, du lundi au vendredi (copier le Cron Job dans un fichier cron.txt dans le dossier)
#
#Rendu
#On a donc les fichiers, dossiers suivant:
#
#exam_NOM/exam.sh
#exam_NOM/sales.txt
#exam_NOM/cron.txt
#Créez une archive exam_NOM.tar
#
#tar -cvf exam_NOM.tar exam_NOM
#Commande scp
#La commande scp permet de transférer de manière sécurisée un fichier ou une archive (les dossiers ne sont pas transférables) via une connexion SSH.
#
#Vous pouvez télécharger votre archive en exécutant la commande suivante sur un terminal de votre propre machine.
#
#scp -i "data_enginering_machine.pem" ubuntu@VOTRE_IP:~/exam_NOM.tar .
#Plusieurs détails concernant la commande ci-dessus:
#- Lorsque vous ouvrez votre terminal sur votre ordinateur local pour transférer votre archive depuis la VM, précisez le chemin absolu vers votre fichier data_enginering_machine.pem
#- Votre archive sera téléchargée dans le même dossier où se trouve votre fichier data_enginering_machine.pem
