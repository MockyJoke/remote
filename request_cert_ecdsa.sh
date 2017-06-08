#!/bin/bash

DOMAIN=$1
EMAIL=$2

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y certbot

openssl ecparam -genkey -name secp384r1 | openssl ec -out ecdsa/ec.key
openssl req -new -sha384 -key ecdsa/ec.key -subj "/CN=$DOMAIN" -reqexts SAN -config <(cat ecdsa/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:$DOMAIN")) -outform der -out ec.csr
sudo certbot certonly -n --email $EMAIL --domains "$DOMAIN" --agree-tos --standalone --text --csr ecdsa/ec.csr -w ecdsa

echo Copying server certificate to config directory...
sudo cp ecdsa/0001_chain.pem config/serverCert.pem
sudo cp ecdsa/ec.key config/serverKey.pem
sudo cp ecdsa/0000_chain.pem config/caCert.pem

echo Done!
