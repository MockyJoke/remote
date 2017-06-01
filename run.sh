#!/bin/bash
cd /home/config
mv ipsec.conf /etc/
mv ipsec.secrets /etc/
mv serverKey.pem /etc/ipsec.d/private
mv serverCert.pem /etc/ipsec.d/certs
sysctl -w net.ipv4.ip_forward=1
iptables -A INPUT -p udp --dport  500 -j ACCEPT
iptables -A INPUT -p udp --dport 4500 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

ipsec start --nofork
