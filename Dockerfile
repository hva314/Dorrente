FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y screen vim tmux curl git unrar unzip\
        subversion build-essential automake apt-utils\
        libtool libcppunit-dev libcurl3-dev \
        libsigc++-2.0-dev unzip unrar-free libncurses-dev
RUN apt-get install -y php php-geoip php7.2-cli php7.2-json \
        php7.2-curl php7.2-cgi php7.2-mbstring \
        libapache2-mod-php libapache2-mod-scgi apache2\
        ffmpeg mediainfo sqlite3
RUN apt-get install -y rtorrent
RUN apt-get install -y openvpn

EXPOSE 8888

COPY pia /pia
COPY rtorrent.rc /root/.rtorrent.rc

COPY init.sh /root/init.sh
RUN chmod +x /root/init.sh
CMD /root/init.sh
