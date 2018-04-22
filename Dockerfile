FROM ubuntu:16.04
MAINTAINER 330k

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install wget sudo apt-utils software-properties-common unzip -y

WORKDIR /root
RUN wget https://github.com/eXperiencePoints/XPCoin/releases/download/1.0.0/XPd-linux-compile-from-source.sh && \
  echo n | sh ./XPd-linux-compile-from-source.sh && \
  wget https://www.dropbox.com/s/wz8sg14ujmx1dnm/xpcoin-bootstrap-peers.zip?dl=0 -O bootstrap.zip && \
  unzip -j bootstrap.zip */*.dat -d /root/.XP && \
  unzip -j bootstrap.zip */database/* -d /root/.XP/database && \
  rm bootstrap.zip

VOLUME ["/root/.XP"]
EXPOSE 28192

ENTRYPOINT /root/XPCoin/src/XPd
