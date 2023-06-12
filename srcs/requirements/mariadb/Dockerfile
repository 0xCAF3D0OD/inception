FROM debian:buster

RUN apt update -y
RUN apt-get install -y mariadb-server

COPY conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/mariadb.cnf
<<<<<<< HEAD
COPY /tools/auto_config.sh /tmp/auto_config.sh

CMD ["bash","/tmp/auto_config.sh"]

EXPOSE 3306
=======
>>>>>>> 39d0613 (resolve conflict main)
