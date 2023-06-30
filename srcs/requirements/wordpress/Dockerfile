FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y bash vim wget
RUN apt-get install -y php7.3 php-phar php-json php-curl php-fpm php-mysqli php-iconv
RUN apt install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress
RUN chown root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

EXPOSE 9000

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /tmp/auto_config.sh
COPY tools/wp-config.php /tmp/wp-config.sh

ENTRYPOINT ["bash","/tmp/auto_config.sh"]

