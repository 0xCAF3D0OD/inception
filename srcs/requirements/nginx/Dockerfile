FROM debian:buster
RUN apt-get update 
RUN apt-get upgrade
RUN apt-get install -y vim curl
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/kdi-noce.crt \
    -keyout /etc/nginx/ssl/kdi-noce.key \
    -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=42/CN=kdi-noce"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

# deamon off to prevent the container from halting
CMD [ "nginx", "-g", "daemon off;" ]
