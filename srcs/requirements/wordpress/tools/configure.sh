#!/bin/sh

# wait for mysql

while mariadb -h$DB_HOST -u$DB_USER -p$DB_PWD $DB_NAME -e "" &>/dev/null; do
    echo "Waiting for mariadb..."
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

	# static website
	mv /tmp/index.html /var/www/html/wordpress/index.html
	
	# adminer
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/wordpress/adminer.php &> /dev/null
	wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/wordpress/adminer.css &> /dev/null
	
	cd /var/www/html/wordpress
	wp core download --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=$DB_HOST --dbprefix=wp_ --dbcharset="utf8" --dbcollate="utf8_general_ci" --extra-php --skip-salts --skip-check --force --insecure
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root
	wp theme install inspiro --activate --allow-root
	ls -la /var/www/html/wordpress 

fi

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7 -F -R
