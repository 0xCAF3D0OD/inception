FROM debian:10
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 39d0613 (resolve conflict main)
RUN apt update && apt install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    vim \
    mariadb-server-10.3
<<<<<<< HEAD

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update && apt-cache policy docker-ce
RUN apt install docker-ce && systemctl status docker
=======

RUN apt update && apt install -y gcc vim curl mariadb-server-10.3
>>>>>>> c309e8f (add echo into script)
=======

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update && apt-cache policy docker-ce
RUN apt install docker-ce && systemctl status docker
>>>>>>> 39d0613 (resolve conflict main)
