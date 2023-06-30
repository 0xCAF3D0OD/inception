FROM	debian:buster

RUN	apt-get update
RUN	apt-get upgrade -y

RUN	apt-get install -y bash vim curl
RUN	apt-get install -y php7.3 php-phar php-json php-curl php-fpm php-mysqli php-iconv
RUN	apt install -y mariadb-client

RUN	mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    --output /usr/bin/wp

RUN	chmod +x  /usr/bin/wp

RUN	wp core download --path=/var/www/wordpress

EXPOSE	9000

COPY	conf/auto_config.sh /tmp/auto_config.sh
COPY	tools/wp-config.php /tmp/wp-config.sh

ENTRYPOINT	["bash","/tmp/auto_config.sh"]
