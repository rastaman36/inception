FROM debian:bullseye


RUN apt-get update -y 

RUN apt-get install php7.4-fpm php7.4-mysql -y

RUN apt-get install curl -y


# COPY ./wp-config.php /var/www/html/
COPY ./script.sh /

RUN chmod +x /script.sh
RUN  mkdir -p /run/php/




CMD [ "/script.sh" ]