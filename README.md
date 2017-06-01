Usage
==================
Download and build the docker image.
-----------

    git clone https://github.com/MockyJoke/remote.git
    cd remote
    docker build -t vpn .
    
Use Certbot to get certificates
==================  

    git clone https://github.com/certbot/certbot.git
    cd certbot
    ./certbot-auto certonly -n --email your@email.com --domains "your.domain.com" --agree-tos --standalone --text
    sudo cp -L /etc/letsencrypt/live/your.domain.com/cert.pem ../config/serverCert.pem
    sudo cp -L /etc/letsencrypt/live/your.domain.com/privkey.pem ../config/serverKey.pem
    
Run server with config files placed inside a config folder
-----------

    docker run -d -p 500:500/udp -p 4500:4500/udp --cap-add=NET_ADMIN -v $(pwd)/config:/home/config vpn
    
