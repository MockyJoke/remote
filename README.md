# remote

Usage
==================
Download and build the docker image.
-----------

    git clone https://github.com/MockyJoke/remote.git
    cd remote
    docker build -t vpn .
    
Run server with config files placed inside a config folder
-----------

    docker run -d -p 500:500/udp -p 4500:4500/udp --cap-add=NET_ADMIN -v $(pwd)/config:/home/config vpn
    
