FROM debian:buster

RUN apt update -y
RUN apt-get install -y mariadb-server

COPY conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/auto_config.sh /tmp/auto_config.sh

EXPOSE 3306

CMD ["bash","/tmp/auto_config.sh"]

