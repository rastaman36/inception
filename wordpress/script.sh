#!/bin/bash


mkdir /var/www/
mkdir /var/www/html


cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$database_name/1"   wp-config.php
sed -i -r "s/username_here/$database_user/1"  wp-config.php
sed -i -r "s/password_here/$db1_pwd/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php


wp core install --url=$DOMAIN_NAME/ --title=$WORDPRESS_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root


# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# mkdir /run/php



php-fpm8.2 -F