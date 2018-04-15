FROM debian:buster
RUN apt-get autoclean
RUN apt-get update
# vpn and general things
RUN apt-get -y install openvpn vim git wget unzip
# dependencies for get_iplayer
RUN apt-get -y install libjson-perl libwww-perl libmojolicious-perl libxml-libxml-perl atomicparsley ffmpeg
# useful compilation of config files
RUN mkdir /purevpnconfig; cd /purevpnconfig; wget --no-check-certificate https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip; unzip linux-files.zip
# get_iplayer
RUN git clone https://github.com/get-iplayer/get_iplayer.git
