#!/bin/bash
docker run -d -p8888:80 -v $(pwd)/data:/data -v $(pwd)/session:/session -v $(pwd)/ruTorrent:/var/www/html torrent
