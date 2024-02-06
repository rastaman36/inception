#!/bin/bash

# Download the latest version of Adminer
wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php

# Set ownership and permissions
chown www-data:www-data /var/www/html/adminer.php
chmod 755 /var/www/html/adminer.php

# Change to the directory where Adminer is located
cd /var/www/html

# Remove the existing index.html file
rm -f index.html

# Start the PHP built-in server to serve Adminer
php -S 0.0.0.0:80 adminer.php