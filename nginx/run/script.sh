#!/bin/sh

echo "Script is running..."

# Generate a private key
openssl genpkey -algorithm RSA -out /etc/ssl/private/private.key



# Generate a self-signed certificate
openssl req -x509 -new -key /etc/ssl/private/private.key -out /etc/ssl/certs/certificate.crt -days 365 -subj "/C=MO/L=BN/O=1337/OU=student/CN=mochaoui.42.ma"



# Append the configuration to Nginx
echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name www.;

    ssl_certificate /etc/ssl/certs/certificate.crt;
    ssl_certificate_key /etc/ssl/private/private.key;

    # ... other configuration ...

    location ~ [^/]\.php(/|$) {
    #     try_files $uri =404;
        fastcgi_pass wordpress:9000;
    #     include fastcgi_params;
    #     fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}" > /etc/nginx/sites-enabled/default

# Start Nginx
nginx -g "daemon off;"