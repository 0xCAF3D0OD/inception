FROM debian

RUN apt update && apt install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN restart php7.3-fpm.service

RUN