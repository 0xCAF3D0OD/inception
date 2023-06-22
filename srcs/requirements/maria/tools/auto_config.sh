#!/bin/bash

service mysql start;

#SQL_DATABASE=maria
#SQL_USER=kdkd
#SQL_PASSWORD=12345
#SQL_ROOT_PASSWORD=12345
#
#echo "database is =${SQL_DATABASE}"
#echo "user is =${SQL_USER}"
#echo "pass is =${SQL_PASSWORD}"
#echo "pass root is =${SQL_ROOT_PASSWORD}"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`{SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysql -u root  -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
