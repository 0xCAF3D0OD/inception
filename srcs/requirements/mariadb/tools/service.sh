#!/bin/bash

<<<<<<< HEAD
service mysql start
=======
service mysql start;
>>>>>>> 39d0613 (resolve conflict main)
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
<<<<<<< HEAD
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe

mysqld
=======
mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
exec mysqld_safe

docker build -t mariadb .
docker run -it mariadb
>>>>>>> 39d0613 (resolve conflict main)
