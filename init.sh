#!/bin/bash
rm /session/rtorrent.lock
screen -S rtorrent -d -m rtorrent &
apachectl -D FOREGROUND
