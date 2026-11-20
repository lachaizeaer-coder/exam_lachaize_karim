# Déploiement automatisé PrestaShop + MySQL avec Ansible

Projet d'examen Ansible – Karim Lachaize (formation DevOps Liora, 2026).

Deux rôles Ansible déploient une boutique e-commerce **PrestaShop 9.2.1** sur deux serveurs :

| Hôte  | Groupe d'inventaire | Rôle         | Contenu                                     |
|-------|---------------------|--------------|---------------------------------------------|
| `db`  | `database`          | `mysql`      | MySQL 8.x, base `prestashop`, utilisateur `prestashop` |
| `web` | `webserver`         | `prestashop` | Apache 2.4 + PHP 8.x + PrestaShop 9.2.1     |

```
 Navigateur ──HTTP 80──▶  web (Apache + PHP + PrestaShop)
                                │
                                │ TCP 3306 (réseau privé du VPC)
                                ▼
                          db (MySQL)
```

Le serveur web se connecte à MySQL par **l'IP privée** de la base. L'utilisateur MySQL `prestashop`
n'est autorisé que depuis **l'IP privée du serveur web**.

## Arborescence

```
ansible/
├── ansible.cfg              # inventaire, roles_path, become, log_path -> logs_ansible.txt
├── requirements.yml         # collections : community.mysql, community.general, ansible.posix
├── install_ansible.sh       # installe Ansible + collections (Ubuntu)
├── website.yaml             # playbook d'orchestration (db puis web)
├── inventory/hosts          # hôtes web / db (IP publiques + IP privées)
├── group_vars/all.yml       # variables partagées (base, utilisateur MySQL, mode d'archive)
├── logs_ansible.txt         # logs des tests
└── roles/
    ├── mysql/               # rôle base de données (voir roles/mysql/README.md)
    └── prestashop/          # rôle serveur web (voir roles/prestashop/README.md)
```

## Prérequis

**Machine de contrôle** (testée sur Ubuntu) :
```bash
./install_ansible.sh        # Ansible + collections de requirements.yml
```
ou, si Ansible est déjà installé :
```bash
ansible-galaxy collection install -r requirements.yml
```

**Serveurs cibles** : 2 instances (testé sur AWS EC2 **Ubuntu 26.04**, PHP 8.5, MySQL 8.4), accès SSH par clé,
utilisateur avec `sudo`. Les rôles prévoient aussi la famille RedHat (RHEL / Rocky / Alma 8-9), non testée.

**Security Groups AWS** :

| Instance | Port | Source                                   |
|----------|------|------------------------------------------|
| web, db  | 22   | IP de la machine de contrôle             |
| web      | 80   | 0.0.0.0/0 (clients + machine de contrôle)|
| db       | 3306 | IP privée du serveur web (`x.x.x.x/32`)  |

## Configuration

1. **Inventaire** `inventory/hosts` : renseigner pour chaque hôte `ansible_host` (IP publique, pour SSH),
   `private_ip` (IP privée, pour la communication web ↔ db), `ansible_user` et `ansible_ssh_private_key_file`.
2. **Variables** `group_vars/all.yml` : nom de la base, utilisateur et mot de passe MySQL de PrestaShop.
3. **Archive PrestaShop** : depuis la version 9, PrestaShop n'est plus publié en zip sur GitHub.
   - `PRESTASHOP_LOCAL_ZIP: true` (configuration utilisée) : télécharger la version *Classic* depuis
     https://prestashop.com/versions/ et la placer dans `roles/prestashop/files/prestashop.zip`
     (fichier non versionné, ~150 Mo).
   - `PRESTASHOP_LOCAL_ZIP: false` : le rôle télécharge `PRESTASHOP_DOWNLOAD_URL`.

## Exécution

```bash
cd ansible
ansible all -m ping                          # test de connectivité
ansible-playbook website.yaml --syntax-check # vérification syntaxique
ansible-playbook website.yaml                # déploiement complet
```

Déployer un seul serveur : `ansible-playbook website.yaml --limit db` (ou `--limit web`).

En fin d'exécution, le rôle `prestashop` affiche l'URL du front office, celle du back office
(dossier `admin…` au nom aléatoire) et l'identifiant administrateur.

## Tests et logs

Toutes les exécutions sont enregistrées dans **`logs_ansible.txt`** (`log_path` dans `ansible.cfg`).
Le fichier livré contient :

1. `ansible all -m ping` → `pong` sur `web` et `db` ;
2. un déploiement complet → `failed=0` ;
3. un 2ᵉ déploiement → `failed=0`, **idempotence** (`web changed=0`, `db changed=1`, voir ci-dessous) ;
4. le nombre de tables créées par PrestaShop dans la base distante (319) ;
5. une requête HTTP sur la boutique → `status: 200`.

Contrôles intégrés aux rôles :
- `mysql` : MySQL écoute bien sur l'IP du serveur (port 3306) ;
- `prestashop` : la base est joignable depuis le serveur web **avant** l'installation, `parameters.php`
  existe après l'installation, la boutique répond HTTP 200 depuis la machine de contrôle.

> Le mot de passe root MySQL est toujours rapporté `changed` : avec `caching_sha2_password`,
> le module ne peut pas comparer le mot de passe haché et le réapplique. C'est attendu.

## Problèmes rencontrés et solutions

| Problème | Solution |
|----------|----------|
| `ansible.builtin.mysql_user` n'existe pas | modules `community.mysql.*` + `requirements.yml` |
| Service MySQL `mysqld` absent sur Ubuntu | variables par OS (`vars/Debian.yml`, `vars/RedHat.yml`) |
| `Plugin 'mysql_native_password' is not loaded` (MySQL 8.4) | utilisateurs en `caching_sha2_password` |
| MySQL n'écoute que sur 127.0.0.1 | `bind-address = 0.0.0.0` + handler ; `force_handlers = True` |
| PrestaShop 1.7 incompatible avec PHP 8.5 | PrestaShop 9.2.1 (PHP 8.1 → 8.5) |
| Pas de zip sur les releases GitHub (PS 9) | archive *Classic* officielle, locale ou par URL |
| Archive contenant un second zip | double extraction idempotente |
| `ErrorLog logs/…` relatif → Apache ne démarre pas | chemins de logs absolus par OS |
| `chdir` évalué avant `creates` | test `stat` de `parameters.php` avant l'installeur |

## Sécurité

- Accès MySQL distant limité à l'IP privée du serveur web (MySQL + ufw/firewalld + Security Group).
- Utilisateurs anonymes et base `test` supprimés.
- Dossier `install/` supprimé après installation, back office dans un dossier au nom aléatoire.
- Les mots de passe sont en clair pour l'examen ; en production, chiffrer `group_vars/all.yml`
  avec `ansible-vault encrypt group_vars/all.yml` et lancer avec `--ask-vault-pass`.

---

## Énoncé de l'exercice

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