#!/bin/bash

# Start MariaDB
/usr/bin/mysqld_safe &

# Wait for MariaDB to start (adjust sleep time as needed)
sleep 10

# Your database setup commands
echo "CREATE DATABASE IF NOT EXISTS $database_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$database_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $database_name.* TO '$database_user'@'%' ;" >> db1.sql
echo "ALTER USER '$DB_USER'@'$DB_HOST' IDENTIFIED BY '$NEW_PASSWORD';" >> db1.sql
# echo "ALTER USER '$database_name'@'$DB_HOST' IDENTIFIED BY '$NEW_PASSWORD';" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# Execute SQL commands
mysql < db1.sql

# Keep the script running to keep the container alive (use a non-blocking command)
while true; do
  sleep 1
done