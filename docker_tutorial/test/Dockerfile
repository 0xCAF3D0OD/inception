FROM debian:10
RUN apt update && apt install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    vim \
    mariadb-server-10.3

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update && apt-cache policy docker-ce
RUN apt install docker-ce && systemctl status docker
