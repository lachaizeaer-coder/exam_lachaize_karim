#!/bin/bash

### Dependencies installation
sudo apt update
sudo apt install -y apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip

### Install WordPress
sudo mkdir -p /srv/www/
sudo chown www-data: srv/www/
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www/

### Configure Apache
    # Config file
sudo tee /etc/apache2/sites-available/wordpress.conf > /dev/null <<EOL
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
EOL

    # Enable site and modules
sudo a2ensite wordpress
sudo a2enmod rewrite
    # Disable default site
sudo a2dissite 000-default
    # Reload Apache
sudo service apache2 reload


