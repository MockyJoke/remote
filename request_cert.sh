#!/bin/bash

DOMAIN=$1
EMAIL=$2

git clone https://github.com/certbot/certbot.git
cd certbot
./certbot-auto certonly -n --email $EMAIL --domains "$DOMAIN" --agree-tos --standalone --text
cd ..
echo Copying server certificate to config directory...
sudo cp -L /etc/letsencrypt/live/$DOMAIN/fullchain.pem config/serverCert.pem
sudo cp -L /etc/letsencrypt/live/$DOMAIN/privkey.pem config/serverKey.pem
sudo cp -L /etc/letsencrypt/live/$DOMAIN/chain.pem config/caCert.pem
echo Done!
