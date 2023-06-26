#!/bin/bash

#source /Users/kdi-noce/Documents/Cursus_42/inception/srcs/.env
#
#echo "database is =${SQL_DATABASE}"
#echo "user is =${SQL_USER}"
#echo "pass is =${SQL_PASSWORD}"
#echo "pass root is =${SQL_ROOT_PASSWORD}"
#mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#mariadbd-safe --nowatch --datadir='/var/lib/mysql'
#
#while ! mysqladmin ping -h ${MARIADB_HOST} --silent; do
#	sleep 1
#	echo "waiting for process mariadbd-safe"
#done
#
#service mysql start;
#
##secure mariadb
#echo "Secure mariadb"
##remove anonymous accounts
#mariadb -e "DELETE FROM mysql.user WHERE User='';"
##remove test database
#mariadb -e "DROP DATABASE IF EXISTS test;"
##remove root account accessible from outside
#mariadb -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
#
#mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#mariadb -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`{SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#mariadb -u root  -e "FLUSH PRIVILEGES;"
#mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
#
#exec mysqld_safe

#Cheking if the database is already created
cat .setup 2>/dev/null

if [ $? -ne 0 ]; then

#  # Run the server in the background and wait for it to start up before creating the database
  mysql-install-db --datadir=/var/lib/mysql \
    --auth-root-authentication-method=normal

  # Give permissions to the database for the user mysql
  chown -R mysql:mysql /var/lib/mysql
  chown -R mysql:mysql /run/mysqld

  # Start the server
  mysqld_safe --datadir=/var/lib/mysql &

  # Wait until mariadb is ready to accept connections
  while ! mysqladmin ping -h "mariadb" --silent; do
    sleep 1
  done

	mariadb -u root -p

  # Create database from .sql file
  eval "echo \"$(cat /tmp/create_user.sql)\"" | mariadb
  touch .setup
else
  echo "Database already created and ready"
fi

# Run the server
mysqld_safe --datadir=/var/lib/mysql
