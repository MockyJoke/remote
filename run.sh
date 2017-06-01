#!/bin/bash
cd /home/config
cp ipsec.conf /etc/
cp ipsec.secrets /etc/
cp serverKey.pem /etc/ipsec.d/private
cp serverCert.pem /etc/ipsec.d/certs
cp caCert.pem /etc/ipsec.d/cacerts
sysctl -w net.ipv4.ip_forward=1
iptables -A INPUT -p udp --dport  500 -j ACCEPT
iptables -A INPUT -p udp --dport 4500 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

ipsec start --nofork
