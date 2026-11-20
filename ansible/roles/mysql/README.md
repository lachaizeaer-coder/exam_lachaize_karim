mysql
=====

Installe et configure un serveur **MySQL** pour PrestaShop :

- installation de MySQL et de PyMySQL (requis par les modules `community.mysql`) ;
- écoute sur toutes les interfaces (`bind-address`) pour accepter le serveur web ;
- sécurisation (équivalent de `mysql_secure_installation`) : mot de passe root, suppression des
  utilisateurs anonymes et de la base `test` ;
- création de la base PrestaShop (`utf8mb4`) et d'un utilisateur autorisé **uniquement depuis l'IP privée
  du serveur web** ;
- ouverture du port 3306 dans le pare-feu (ufw, ou firewalld s'il est actif) ;
- vérification finale que MySQL écoute sur le port 3306.

Le rôle est idempotent : seul le mot de passe root est rapporté `changed` à chaque exécution
(mot de passe `caching_sha2_password`, non comparable par le module).

Requirements
------------

- Collections : `community.mysql`, `community.general`, `ansible.posix` (voir `requirements.yml`).
- OS testé : Ubuntu 26.04 (MySQL 8.4). Prévu : RHEL / Rocky / AlmaLinux 8-9 (paquet `mysql-server`).
  Non compatible avec Debian et Amazon Linux 2023, qui fournissent MariaDB.
- L'inventaire doit contenir un groupe `webserver` ; la variable d'hôte `private_ip` du serveur web
  sert à limiter l'accès MySQL.

Role Variables
--------------

| Variable | Où | Défaut | Description |
|----------|----|--------|-------------|
| `MYSQL_DB_NAME` | group_vars | `prestashop` | Base de données de PrestaShop |
| `MYSQL_WEB_USER_LOGIN` | group_vars | `prestashop` | Utilisateur MySQL de PrestaShop |
| `MYSQL_WEB_USER_PASSWORD` | group_vars | – | Mot de passe de cet utilisateur |
| `MYSQL_PORT` | defaults | `3306` | Port MySQL |
| `MYSQL_BIND_ADDRESS` | defaults | `0.0.0.0` | Interface d'écoute |
| `MYSQL_WEB_HOST` | defaults | `private_ip` du 1er hôte `webserver`, sinon `%` | Hôte autorisé pour l'utilisateur PrestaShop |
| `MYSQL_HOST` | vars | `localhost` | Hôte du compte root |
| `MYSQL_ROOT_NAME` / `MYSQL_ROOT_LOGIN` | vars | `root` | Compte administrateur |
| `MYSQL_ROOT_PASSWORD` | vars | – | Mot de passe root défini par le rôle |

Variables par OS (`vars/Debian.yml`, `vars/RedHat.yml`) : `mysql_packages`, `mysql_service`
(`mysql` / `mysqld`), `mysql_socket`, `mysql_config_file`.

Dependencies
------------

Aucune.

Example Playbook
----------------

    - name: Deploy MySQL database server
      hosts: database
      become: true
      roles:
        - mysql

Author Information
------------------

Karim Lachaize – examen Ansible, formation DevOps Liora 2026.
