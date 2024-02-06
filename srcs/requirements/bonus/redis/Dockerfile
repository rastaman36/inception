FROM debian:bullseye


RUN apt-get -y update && \
    apt install redis-server -y && \
    apt install php-redis -y

# COPY ./script.sh /
RUN sed -i -r "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf
# RUN chmod +x /script.sh


CMD ["redis-server", "--protected-mode" , "no"]