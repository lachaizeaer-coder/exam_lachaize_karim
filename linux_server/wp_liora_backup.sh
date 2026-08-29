#!/bin/bash
examdir="/home/ubuntu/exerciceadminlinux_lachaize_karim"
backupdir="/home/ubuntu/exerciceadminlinux_lachaize_karim/backup"

###### CONFIG FILES ######
#backup wordpress config file
rsync -av /etc/nginx/conf.d/wordpress.conf $backupdir
#backup nginx config file
rsync -av /etc/nginx/nginx.conf $backupdir
#backup nginx config file
rsync -av /var/www/html/wordpress/wp-config.php $backupdir

###### LOG FILES ######
#backup access log
rsync -av /var/log/nginx/access.log $backupdir
#backup error log
rsync -av /var/log/nginx/error.log $backupdir

###### SSL FILES ######
#backup ssl fullchain
sudo rsync -avL /etc/letsencrypt/live/wordpress.cours-liora.abrdns.com/fullchain.pem $backupdir
#backup ssl privkey
sudo rsync -avL /etc/letsencrypt/live/wordpress.cours-liora.abrdns.com/privkey.pem $backupdir
#backup ssl options config file
rsync -av /etc/letsencrypt/options-ssl-nginx.conf $backupdir
#backup ssl dhparams.pem
rsync -av /etc/letsencrypt/ssl-dhparams.pem $backupdir

###### MARIADB DATABASE ######
mysqldump -u root -pliora2026 wordpress > $backupdir/wp_database.sql

###### ARCHIVE & COMPRESS ######
tar -czf $examdir/backup_exam_adminlinux.tar.gz -C $backupdir .
