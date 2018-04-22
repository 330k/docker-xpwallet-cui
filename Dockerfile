FROM ubuntu:16.04
MAINTAINER 330k

RUN apt-get update && \
  apt-get upgrade -y

RUN apt-get install wget sudo apt-utils software-properties-common -y

WORKDIR /root
RUN wget https://github.com/eXperiencePoints/XPCoin/releases/download/1.0.0/XPd-linux-compile-from-source.sh
RUN echo n | sh ./XPd-linux-compile-from-source.sh

VOLUME ["/root/.XP"]

ENTRYPOINT /root/XPCoin/src/XPd
