FROM ubuntu:14.04

# Autor
MAINTAINER Jeferson Oliveira <jefersondeoliveiralopes@gmail.com>

# Variaveis de ambiente
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/docker
WORKDIR /home/docker
EXPOSE 3000

# Instalando e atualizando pacotes como root

USER root

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y expect-lite

RUN rm -vrf /var/lib/apt/lists/*
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN add-apt-repository -y ppa:webupd8team/java
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN mkdir /data && \
mkdir /data/db
RUN apt-get install -y mongodb-org
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer


RUN wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz
RUN tar -vzxf ${HOME}/node-v0.10.35.tar.gz && \
rm -rf ${HOME}/node-v0.10.35.tar.gz
RUN cd ${HOME}/node-v0.10.35 && \
./configure && \
make install
RUN npm install nodemon -g
RUN npm install bower@1.3 -g


# Configurando timezone
RUN echo "" > /etc/timezone && \
echo "America/Sao_Paulo" > /etc/timezone && \
dpkg-reconfigure --frontend noninteractive tzdata

# Criando usuario docker
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/docker && \
    echo "docker:x:${uid}:${gid}:docker,,,:/home/docker:/bin/bash" >> /etc/passwd && \
    echo "docker:x:${uid}:" >> /etc/group && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \
    chmod 0440 /etc/sudoers.d/docker && \
    chown ${uid}:${gid} -R /home/docker
RUN chmod 777 -R /data && \
chown -R docker /data

USER docker

CMD bash
