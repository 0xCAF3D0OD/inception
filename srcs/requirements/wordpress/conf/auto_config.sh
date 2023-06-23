#!bin/bash

set -x
sleep 10

if [ ! -e /var/www/wordpress/wp-config.php ]; then
  echo "wp install"

	wp core download --allow-root --path='/var/www/wordpress' --locale=fr_FR
	wp config create --allow-root	--path='/var/www/wordpress' --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306

	wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD  --admin_email=$ADMIN_EMAIL
	wp user create --allow-root --path='/var/www/wordpress' >> /log.txt --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS
fi

if [ ! -d /run/php ]; then
	mkdir ./run/php
fi

/usr/sbin/php-fpm7.3 -F
