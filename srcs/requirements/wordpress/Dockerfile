FROM alpine:3.13
RUN	apk add --quiet --no-cache --update php7 php7-phar \
		php7-json php7-curl php7-fpm php7-mysqli php7-iconv 

# php config
RUN    adduser -S nginx &&    addgroup -S nginx
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

WORKDIR /var/www/html/wordpress

# static website
COPY conf/index.html /tmp/index.html

COPY tools/configure.sh /tmp/configure.sh
ENTRYPOINT [ "sh", "/tmp/configure.sh" ]
