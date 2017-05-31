FROM debian:jessie

RUN apt-get update 
    && apt-get install -y strongswan libcharon-extra-plugins moreutils

RUN iptables -A INPUT -p udp --dport  500 -j ACCEPT
    && iptables -A INPUT -p udp --dport 4500 -j ACCEPT
    && echo 1 > /proc/sys/net/ipv4/ip_forward


EXPOSE 4500/udp 500/udp

