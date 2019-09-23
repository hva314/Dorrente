#!/bin/bash
screen -S rtorrent -d -m rtorrent &
apachectl -D FOREGROUND
