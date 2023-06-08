FROM debian:buster

RUN apt update -y
RUN apt-get install -y mariadb-server

COPY conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/mariadb.cnf
COPY /tools/service2.sh /tools/service2.sh

CMD ["./tools/service2.sh"]