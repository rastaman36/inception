FROM debian:bullseye

RUN apt -y update && \
    apt -y install wget php php-mysql

COPY ./script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]