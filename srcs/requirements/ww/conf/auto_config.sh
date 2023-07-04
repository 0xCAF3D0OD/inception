#!bin/bash

#set -x
#sleep 10
#
#if [ ! -e /var/www/wordpress/wp-config.php ]; then
#  echo "wp install"
#
#	wp core download --allow-root --path='/var/www/wordpress' --locale=fr_FR
#	wp config create --allow-root	--path='/var/www/wordpress' --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306
#
#	wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD  --admin_email=$ADMIN_EMAIL
#	wp user create --allow-root --path='/var/www/wordpress' >> /log.txt --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS
#fi
#
#if [ ! -d /run/php ]; then
#	mkdir ./run/php
#fi
#
#/usr/sbin/php-fpm7.3 -F
#target="/etc/php7.3/php-fpm.d/www.conf"

grep -E "listen = 127.0.0.1" $target > /dev/null 2>&1
if [ $? -eq 0 ]; then
    sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $target
    echo "env[DB_HOST] = \$DB_HOST" >> $target
    echo "env[DB_USER] = \$DB_USER" >> $target
    echo "env[DB_PASSWORD] = \$DB_PASSWORD" >> $target
    echo "env[DB_DATABASE] = \$DB_DATABASE" >> $target
fi

if [ ! -e "wp-config.php" ]; then
    cp /conf/auto_config.php ./auto_config.php
    sleep 5

    wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email

    wp plugin update --all

    wp theme install oceanwp --activate

    wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD

    wp post generate --count=3 --post_title="Inception"
fi

php-fpm --nodaemonize

