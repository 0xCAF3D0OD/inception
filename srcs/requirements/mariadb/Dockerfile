FROM debian:buster

RUN apt-get update
RUN	apt-get upgrade
RUN	apt-get install -y mariadb-server vim

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/create_user.sh /tmp/create_user.sh
RUN chmod +x /tmp/create_user.sh

CMD ["bash", "/tmp/create_user.sh"]