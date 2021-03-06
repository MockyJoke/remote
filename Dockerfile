FROM debian:jessie

RUN apt-get update && apt-get install -y strongswan libcharon-extra-plugins moreutils iptables
RUN mkdir /home/remote

ADD run.sh /run.sh

EXPOSE 4500/udp 500/udp
ENTRYPOINT /bin/bash /run.sh
