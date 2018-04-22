FROM ubuntu:16.04
MAINTAINER 330k

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install wget sudo apt-utils software-properties-common -y

WORKDIR /root
RUN wget https://github.com/eXperiencePoints/XPCoin/releases/download/1.0.0/XPd-linux-compile-from-source.sh
RUN echo n | sh ./XPd-linux-compile-from-source.sh

WORKDIR /root/.XP
RUN wget https://www.dropbox.com/s/wz8sg14ujmx1dnm/xpcoin-bootstrap-peers.zip?dl=0 && \
  unzip -j xpcoin-boostrap-peers.zip?dl=0

VOLUME ["/root/.XP"]
EXPOSE 28192

ENTRYPOINT /root/XPCoin/src/XPd
