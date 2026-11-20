prestashop
==========

Installe **PrestaShop 9.2.1** (édition Classic) sur Apache + PHP et le connecte à une base MySQL distante :

- installation d'Apache, de PHP et des extensions requises (curl, gd, intl, mbstring, xml, zip, bcmath, mysql) ;
- réglages PHP recommandés (`memory_limit`, `max_input_vars`, …) ;
- vérification que la base distante est joignable sur le port 3306 **avant** l'installation ;
- copie (ou téléchargement) puis double extraction de l'archive officielle (elle contient un second zip) ;
- installation non interactive avec l'installeur CLI (`install/index_cli.php`), qui crée les tables dans
  la base distante, puis suppression du dossier `install/` ;
- virtual host Apache dédié, `mod_rewrite`, désactivation du site par défaut ;
- ouverture du port 80 (ufw, ou firewalld s'il est actif) ; booléens SELinux sur RedHat ;
- contrôle final : la boutique répond HTTP 200, affichage des URL front office / back office.

Le rôle est idempotent : l'installeur n'est relancé que si `app/config/parameters.php` n'existe pas.

Requirements
------------

- Collections : `community.general`, `ansible.posix` (voir `requirements.yml`).
- OS testé : Ubuntu 26.04 (Apache 2.4, PHP 8.5). Prévu : RHEL / Rocky / AlmaLinux 8-9 (flux `php:8.2`).
- Une base MySQL accessible (rôle `mysql`) : l'inventaire doit contenir un groupe `database` dont le
  premier hôte définit `private_ip`.
- Archive PrestaShop *Classic* : soit dans `files/prestashop.zip` (`PRESTASHOP_LOCAL_ZIP: true`),
  soit accessible par `PRESTASHOP_DOWNLOAD_URL`. Elle est disponible sur https://prestashop.com/versions/.

Role Variables
--------------

Toutes les variables sont dans `defaults/main.yml` et peuvent être surchargées dans `group_vars`.

| Variable | Défaut | Description |
|----------|--------|-------------|
| `PRESTASHOP_VERSION` | `9.2.1-6.1` | Version complète (cœur - paquet Classic) |
| `PRESTASHOP_EDITION` | `basic` | Édition dans le nom du fichier |
| `PRESTASHOP_DOWNLOAD_URL` | URL `assets.prestashop3.com` | Utilisée si `PRESTASHOP_LOCAL_ZIP` est `false` |
| `PRESTASHOP_LOCAL_ZIP` | `false` | `true` : copie `files/prestashop.zip` depuis la machine de contrôle |
| `PRESTASHOP_ROOT` | `/var/www/prestashop` | Racine du site |
| `PRESTASHOP_DOMAIN` | `ansible_host` | Domaine de la boutique (IP publique du serveur web) |
| `PRESTASHOP_SHOP_NAME` | `Liora Shop` | Nom de la boutique |
| `PRESTASHOP_LANGUAGE` / `PRESTASHOP_COUNTRY` | `fr` / `fr` | Langue et pays |
| `PRESTASHOP_DB_PREFIX` | `ps_` | Préfixe des tables |
| `PRESTASHOP_ADMIN_FIRSTNAME` / `_LASTNAME` | `Admin` / `Liora` | Compte administrateur |
| `PRESTASHOP_ADMIN_EMAIL` | `admin@liora-shop.com` | Identifiant du back office |
| `PRESTASHOP_ADMIN_PASSWORD` | – | Mot de passe du back office |
| `DB_SERVER` | `private_ip` du 1er hôte `database` | Serveur MySQL |
| `DB_PORT` | `3306` | Port MySQL |

Variables partagées lues dans `group_vars` : `MYSQL_DB_NAME`, `MYSQL_WEB_USER_LOGIN`, `MYSQL_WEB_USER_PASSWORD`.

Variables par OS (`vars/Debian.yml`, `vars/RedHat.yml`) : `prestashop_packages`, `apache_service`,
`apache_user`, `apache_vhost_file`, `apache_log_dir` (et `php_ini_dir` sur RedHat).

> Le domaine est enregistré dans la base à l'installation : utiliser une Elastic IP ou un nom DNS,
> sinon un changement d'IP publique de l'instance rend la boutique inaccessible.

Dependencies
------------

Aucune dépendance déclarée ; le rôle `mysql` doit être exécuté avant sur l'hôte de base de données.

Example Playbook
----------------

    - name: Deploy PrestaShop web server
      hosts: webserver
      become: true
      roles:
        - prestashop

Author Information
------------------

Karim Lachaize – examen Ansible, formation DevOps Liora 2026.
