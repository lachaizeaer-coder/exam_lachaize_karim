#!/bin/bash
DB_HOST="${db_host}"
DB_NAME="${db_name}"
DB_USER="${db_user}"
DB_PASS="${db_password}"


### Dependencies installation
echo "Installing dependencies..."
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
echo "Dependencies installed."

### Install WordPress
echo "Installing WordPress..."
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
echo "Configuring Apache..."
sudo a2ensite wordpress
sudo a2enmod rewrite
    # Disable default site
sudo a2dissite 000-default
    # Reload Apache
sudo service apache2 reload
echo "Apache configured."

### Configure WordPress to use AWS RDS
echo "Configuring WordPress..."

# Create wp-config.php automatically pointing to your AWS RDS instance
sudo -u www-data wp config create \
  --dbname="$DB_NAME" \
  --dbuser="$DB_USER" \
  --dbpass="$DB_PASS" \
  --dbhost="$DB_HOST" \
  --path='/srv/www/wordpress'


### Configure SSL
echo "Configuring SSL..."
### SSL Activation
sudo a2enmod ssl

### Certificate generation using OpenSSL (365 days validity)
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/apache-selfsigned.key \
  -out /etc/ssl/certs/apache-selfsigned.crt \
  -subj "/CN=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"

### WordPress SSL VirtualHost configuration
cat <<EOF | sudo tee /etc/apache2/sites-available/wordpress-ssl.conf
<IfModule mod_ssl.c>
  <VirtualHost _default_:443>
    ServerAdmin webmaster@localhost
    DocumentRoot /srv/www/wordpress

    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt
    SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key

    <Directory /srv/www/wordpress>
      Options FollowSymLinks
      AllowOverride All
      Require all granted
    </Directory>
  </VirtualHost>
</IfModule>
EOF

### Enable SSL site and restart Apache
sudo a2ensite wordpress-ssl
sudo systemctl restart apache2

echo "SSL configured."