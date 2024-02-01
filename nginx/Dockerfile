# Use the Debian base image
FROM debian:buster

# Update the package lists and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt install openssl -y

# Set the working directory
# WORKDIR /etc

# Copy the script into the image
COPY ./run/script.sh /

# Set executable permissions for the script
RUN chmod +x /script.sh

# Start Nginx when the container starts
CMD ["/script.sh"]