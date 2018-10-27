FROM ubuntu:18.04

LABEL maintainer="Afzal Hossain <afzal.csedu@gmail.com>"

RUN apt-get update && apt-get upgrade -y

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install curl gzip software-properties-common nginx \
    php7.2-fpm php7.2-xml php7.2-bz2 php7.2-zip php7.2-mysql php7.2-intl \
    php7.2-gd php7.2-curl php7.2-soap php7.2-mbstring composer

RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php/7.2/fpm/php.ini && \
    sed -i 's/max_execution_time = 30/max_execution_time = 300/g' /etc/php/7.2/fpm/php.ini && \
    sed -i 's/max_input_time = 60/max_input_time = 300/g' /etc/php/7.2/fpm/php.ini && \
    sed -i 's/post_max_size = 8M/post_max_size = 28M/g' /etc/php/7.2/fpm/php.ini && \
    sed -i 's/memory_limit = 128M/memory_limit = 512M/g' /etc/php/7.2/fpm/php.ini

RUN apt-get -y install supervisor
RUN rm /var/www/html/index.nginx-debian.html && \
    mkdir -p /var/www/html/public && \
    touch /var/www/html/public/index.php && \
    echo '<?php phpinfo();' > /var/www/html/public/index.php
COPY nginx-conf/default /etc/nginx/sites-available/default

EXPOSE 80

STOPSIGNAL SIGTERM

CMD service php7.2-fpm start && service supervisor start && nginx -g "daemon off;"
