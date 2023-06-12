#!bin/bash

set -x
sleep 10

if [ ! -e /var/www/wordpress/wp-config.php ]; then
  echo "wp install"
#  wp config create --allow-root --path='/var/www/wordpress' --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST}
#  wp core install --allow-root --path='/var/www/wordpress' --url=${WORDPRESS_URL} --title="${WORDPRESS_TITLE}" --admin_user=${WORDPRESS_ADM_USER} --admin_password=${WORDPRESS_ADM_PASSWORD} --admin_email="${WORDPRESS_ADM_USER}@${WORDPRESS_URL}.ch"
#	wp user create --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
#
#fi
	cd /var/www/wordpress/ --allow-root
	wp core download --allow-root --locale=fr_FR
	wp config create --path='/var/www/wordpress' --allow-root	--dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306

	wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD  --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
#	wp user create --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
	fi
