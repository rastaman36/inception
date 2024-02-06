# Use Debian Bullseye as the base image
FROM debian:bullseye

# Install Nginx
RUN apt-get update && apt-get install -y nginx

RUN mkdir /mochaoui

# Copy HTML files to Nginx document root directory
COPY ./index.html /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]