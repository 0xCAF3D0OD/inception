FROM debian:buster

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y vim curl nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/kdi.pem \
        -keyout /etc/nginx/ssl/kdi.key \
        -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42 School/OU=kdi/CN=kdi/"


RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/ngx.conf

RUN chown -R www-data:www-data /var/www/html

# deamon off to prevent the container from halting
CMD [ "nginx", "-g", "daemon off;" ]
