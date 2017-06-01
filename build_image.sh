#!/bin/bash

DOMAIN=$1
PASSWORD=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | head --bytes 8)
sed -i "s/VPNSERVER_FQDN/$DOMAIN/g" config/ipsec.conf
sed -i "s/VPNSERVER_FQDN/$DOMAIN/g" config/ipsec.secrets
echo Randomly generating default vpn username/PASSWORD
echo Username: vpnuser
echo Password: $PASSWORD
sed -i "s/VPNUSER_PWD/$PASSWORD/g" config/ipsec.secrets
docker build . -t vpn
