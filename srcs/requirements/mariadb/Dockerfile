FROM debian:buster

RUN apt-get update
RUN	apt-get upgrade -y
RUN	apt-get install -y mariadb-server vim

RUN mkdir -p /var/lib/mysqld /run/mysqld

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/create_user.sql /tmp/create_user.sql

COPY conf/create_user.sh /tmp/create_user.sh
RUN chmod +x /tmp/create_user.sh

EXPOSE 3306
CMD ["sh", "/tmp/create_user.sh"]
