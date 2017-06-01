Usage
==================
Download and build the docker image.
-----------

    git clone https://github.com/MockyJoke/remote.git
    cd remote

Use Certbot to get certificates
==================

    sudo bash request_cert.sh <your.domain.com> <your@email.com>
    
Run server with config files placed inside a config folder
-----------
    sudo bash build_image.sh <your.domain.com>
    docker run -d -p 500:500/udp -p 4500:4500/udp --cap-add=NET_ADMIN -v $(pwd)/config:/home/config vpn
    
