FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y vim tmux curl git \
        subversion build-essential automake \
        libtool libcppunit-dev libcurl3-dev \
        libsigc++-2.0-dev unzip unrar-free libncurses-dev
RUN apt-get install -y php php-geoip php7.2-cli php7.2-json \
        php7.2-curl php7.2-cgi php7.2-mbstring \
        libapache2-mod-php libapache2-mod-scgi apache2
RUN apt-get install -y rtorrent
RUN apt-get install -y unrar unzip ffmpeg mediainfo curl sqlite3 -y

RUN rm -rf /var/www/html
RUN git clone https://github.com/Novik/ruTorrent.git /var/www/html
RUN apt-get install -y screen

EXPOSE 80

COPY rtorrent.rc /root/.rtorrent.rc

COPY init.sh /root/init.sh
RUN chmod +x /root/init.sh
CMD /root/init.sh
