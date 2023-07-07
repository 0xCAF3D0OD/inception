#!/bin/sh

# wait for mysql

while mariadb -h$DB_HOST -u$DB_USER -p$DB_PWD $DB_NAME -e "" &>/dev/null; do
    echo "Waiting for mariadb..."
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

	echo "7"
	# static website
	mv /tmp/index.html /var/www/html/index.html
	
	echo "8"
	# adminer
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
	wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null
	
	cd /var/www/html/wordpress
	echo "9"
	wp core download --allow-root
	echo "10"	
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=$DB_HOST --dbprefix=wp_ --dbcharset="utf8" --dbcollate="utf8_general_ci" --extra-php --skip-salts --skip-check --force --insecure
#	wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root --force
	echo "11"
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root
	echo "12"
	wp theme install inspiro --activate --allow-root
	echo "13"
	ls -la /var/www/html/wordpress 

	echo "14"
	# enable redis cache
	#sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      wp-config.php
	#sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
	##sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
	#sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
	#sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
	#sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php
	#
	#echo "15"
	#wp plugin install redis-cache --activate --allow-root
	#wp plugin update --all --allow-root

fi

#echo "12"
#wp redis enable --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7 -F -R
