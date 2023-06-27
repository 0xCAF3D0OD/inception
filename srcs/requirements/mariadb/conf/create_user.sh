#!/bin/sh

# Cheking if the database is already created
cat .exist 2>/dev/null

if [ $? -ne 0 ]; then

  # Run the server in the background and wait for it to start up before creating the database
  mysql_install_db --datadir=/var/lib/mysql \
    --auth-root-authentication-method=normal

  # Give permissions to the database for the user mysql
  chown -R mysql:mysql /var/lib/mysql
  chown -R mysql:mysql /run/mysqld

  # Start the server
  ls -la /var/lib/mysql
  mysqld_safe --datadir=/var/lib/mysql &

  # Wait until mariadb is ready to accept connections
  while ! mysqladmin ping -h "mariadb" --silent; do
    sleep 1
  done

  # Create database from .sql file
  eval "echo \"\$(cat /tmp/create_user.sql)\"" | mariadb
  touch .exist
else
  echo "Database already created and ready"
fi

# Run the server
mysqld_safe --datadir=/var/lib/mysql


#cat .exist 2> /dev/null
#if [ $? -ne 0 ]; then
#
#	# Run the server in the background and wait for it to start up before creating the database
#	mysql_install_db --datadir=/var/lib/mysql \
#		--auth-root-authentication-method=normal
#
#	# Give permissions to the database for the user mysql
#	chown -R mysql:mysql /var/lib/mysql
#	chown -R mysql:mysql /run/mysqld
#
#	usr/bin/mysqld_safe --datadir=/var/lib/mysql &
#
#	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
#    	sleep 1
#	done
#
#	eval "echo \"$(cat /tmp/create_user.sql)\"" | mariadb
#	touch .exist
#else
#	usr/bin/mysqld_safe --datadir=/var/lib/mysql
#fi
