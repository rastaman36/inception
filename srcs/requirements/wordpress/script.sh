#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html

# Download WordPress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

# Rename and configure wp-config.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i -r "s/database_name_here/$database_name/1"   wp-config.php
sed -i -r "s/username_here/$database_user/1"  wp-config.php
sed -i -r "s/password_here/$db1_pwd/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php

# Add WP_REDIS_HOST definition before other configurations
sed -i "/define( 'WP_DEBUG', false );/i define('WP_REDIS_HOST', 'redis');" /var/www/html/wp-config.php

# Configure PHP-FPM
echo "
[www]
user = www-data
listen = 0.0.0.0:9000
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
pm.max_requests = 500
" > /etc/php/7.4/fpm/pool.d/www.conf

# Install WordPress and create user
wp core install --url=$DOMAIN_NAME/ --title=$WORDPRESS_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_USER_EMAIL --role=author --user_pass=$WP_USR_PWD --allow-root

# Install and enable Redis cache plugin
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# Start PHP-FPM
php-fpm7.4 -F