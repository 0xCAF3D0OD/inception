FROM debian

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server"

CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld"]