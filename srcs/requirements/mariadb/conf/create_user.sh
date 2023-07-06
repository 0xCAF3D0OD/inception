#!/bin/sh
# Cheking if the database is already created
#cat .exist 2>/dev/null
#
#if [ $? -ne 0 ]; then
# # Run the server in the background and wait for it to start up before creating the database
#  mysql_install_db
#
# # Give permissions to the database for the user mysql
#  chown -R mysql:mysql /var/lib/mysql
#  chown -R mysql:mysql /run/mysqld
#
#  # Start the server
#  mysqld_safe &
#
#  # Wait until mariadb is ready to accept connections
#  while ! mysqladmin ping -h "mariadb" --silent; do
#    sleep 1
#  done
#
#  # Create database from .sql file
#  eval "echo \"\$(cat /tmp/create_user.sql)\"" | mariadb
#  touch .exist
#else
#  echo "Database already created and ready"
#fi
#
## Run the server
#mysqld_safe

cat .exist 2> /dev/null
if [ $? -ne 0 ]; then

	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat /tmp/create_user.sql)\"" | mariadb -u root -p12345
	touch .exist
else
	usr/bin/mysqld_safe --datadir=/var/lib/mysql
fi
