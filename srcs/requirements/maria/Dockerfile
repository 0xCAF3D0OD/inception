FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y mariadb-server

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/mariadb.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/auto_config.sh /tmp/auto_config.sh
#COPY tools/create_user.sh /tmp/create_user.sh

EXPOSE 3306

CMD ["bash","/tmp/auto_config.sh"]

#CMD ["bash","/tmp/create_user.sh"]
#FROM alpine:3.14
#
#LABEL maintainer="Martin Jean-Christio <jmartin@student.42lausanne.ch>"
#
## Install mariadb
#RUN apk update && apk upgrade \
#    && apk add --no-cache --quiet --update \
#    	   mariadb mariadb-client vim
#
#RUN mkdir -p /var/lib/mysqld /run/mysqld
#
## Copy the database configuration file
#COPY ./conf/create_db.sql /tmp/create_db.sql
#
## Copy the server configuration file
#COPY ./conf/mariadb.cnf /etc/my.cnf.d/
#
## Copy the script to create the database
#COPY ./tools/auto_config.sh /tmp/auto_config.sh
#RUN chmod +x /tmp/auto_config.sh
#
## Run the entrypoint script
#ENTRYPOINT ["sh", "/tmp/auto_config.sh"]
