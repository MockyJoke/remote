#!/bin/bash

DOMAIN=$1

sed -i 's/VPNSERVER_FQDN/$DOMAIN/g' ipsec.conf
sed -i 's/VPNSERVER_FQDN/$DOMAIN/g' ipsec.secret
dockek build . -t vpn
