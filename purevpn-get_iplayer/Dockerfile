FROM debian:buster
RUN apt-get autoclean
RUN apt-get update
# vpn and general things
RUN apt-get -y install vim git wget unzip net-tools
# dependencies for get_iplayer
RUN apt-get -y install libjson-perl libwww-perl libmojolicious-perl libxml-libxml-perl atomicparsley ffmpeg
# purevpn client
RUN wget http://public.imbusch.net/purevpn_amd64.deb; dpkg -i purevpn_amd64.deb
# get_iplayer
RUN git clone https://github.com/get-iplayer/get_iplayer.git
# copy credentials
COPY credentials.txt /
COPY prepare.sh /
# based on: https://support.purevpn.com/setup-purevpn-app-on-linux
# purevpn --login
# type in ….
# service purevpn restart
# purevpn --connect "EN"
### openvpn stuff doesn't seem to work
# useful compilation of config files
# RUN mkdir /purevpnconfig; cd /purevpnconfig; wget --no-check-certificate https://s3-us-west-1.amazonaws.com/heartbleed/linux/linux-files.zip; unzip linux-files.zip
