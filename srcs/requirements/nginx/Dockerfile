FROM debian:buster
RUN apt update && apt upgrade
RUN apt install -y vim && apt install -y curl
RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/kdi-noce.crt \
    -keyout /etc/nginx/ssl/kdi-noce.key \
    -subj "/C=FR/ST=Lausanne/L=Lausanne/O=42 School/OU=kdi-noce/CN=kdi-noce/"

RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]
