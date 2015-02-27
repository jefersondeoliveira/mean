FROM ubuntu:14.04

# Autor
MAINTAINER Jeferson Oliveira <jefersondeoliveiralopes@gmail.com>

# Variaveis de ambiente
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/jeferson-docker
WORKDIR /home/jeferson-docker
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


RUN wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz
RUN tar -vzxf ${HOME}/node-v0.10.35.tar.gz && \
rm -rf ${HOME}/node-v0.10.35.tar.gz
RUN cd ${HOME}/node-v0.10.35 && \
./configure && \
make install
RUN npm install nodemon -g


# Configurando timezone
RUN echo "" > /etc/timezone && \
echo "America/Sao_Paulo" > /etc/timezone && \
dpkg-reconfigure --frontend noninteractive tzdata



CMD bash
