Docker image for strongswan ikev2 vpn with Let's Encrypt certificates. 
==================
Download the repo
-----------

    git clone https://github.com/MockyJoke/remote.git
    cd remote

Use Certbot to get certificates
-----------

    sudo bash request_cert.sh <your.domain.com> <your@email.com>
    
Prepare config files & generate initial password
-----------

    sudo bash build_image.sh <your.domain.com>
    
Run server with config files placed inside a config folder
-----------

    docker run -d -p 500:500/udp -p 4500:4500/udp --cap-add=NET_ADMIN -v $(pwd)/config:/home/config vpn
    
