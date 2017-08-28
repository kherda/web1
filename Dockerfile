# PHP docker development env
FROM        ubuntu:latest

# basic env fix
ENV         TERM xterm

# install packages
RUN         apt-get update && apt-get dist-upgrade -y
RUN         apt-get install -y htop nano curl acl \
            nginx php7.0-common php7.0-cli php7.0-fpm php7.0-mcrypt php7.0-mysql php7.0-gd php7.0-curl php7.0-mbstring

# configure services
ADD         config/nginx/nginx.conf /etc/nginx/
ADD         config/nginx/constructionequipment.conf /etc/nginx/sites-available/
ADD         config/nginx/timezone.ini /etc/php7.0/fpm/conf.d/
ADD         config/php7.0/timezone.ini /etc/php7.0/cli/conf.d/
ADD         config/php7.0/pool.conf /etc/php7.0/fpm/pool.d/

RUN         ln -s /etc/nginx/sites-available/*.conf /etc/nginx/sites-enabled/
RUN         rm /etc/nginx/sites-enabled/default

COPY          web /var/www/

# mount
VOLUME      /var/www
WORKDIR     /var/www

EXPOSE      80

CMD         service php7.0-fpm start && service nginx start
