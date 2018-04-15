https://hub.docker.com/r/ivonet/purevpn/
docker build -t purevpn:0.1 . 
docker run -it --entrypoint /bin/bash purevpn:0.1
