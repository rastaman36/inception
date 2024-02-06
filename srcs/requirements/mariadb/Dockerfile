# Use the Debian base image
FROM debian:bullseye

# Update the package lists and install Nginx
RUN apt-get update && \
    apt-get install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/


COPY ./script.sh /

RUN chmod +x /script.sh

# Start Nginx when the container starts
CMD ["/script.sh"]