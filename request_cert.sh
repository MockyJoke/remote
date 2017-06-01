#!/bin/bash

DOMAIN=$1
EMAIL=$2

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y certbot
sudo certbot certonly -n --email $EMAIL --domains "$DOMAIN" --agree-tos --standalone --text

echo Copying server certificate to config directory...
sudo cp -L /etc/letsencrypt/live/$DOMAIN/fullchain.pem config/serverCert.pem
sudo cp -L /etc/letsencrypt/live/$DOMAIN/privkey.pem config/serverKey.pem
sudo cp -L /etc/letsencrypt/live/$DOMAIN/chain.pem config/caCert.pem
echo Done!
