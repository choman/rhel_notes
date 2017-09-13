#!/usr/bin/bash

TURL=https://github.com/docker/compose/releases/latest
DURL=https://github.com/docker/compose/releases/download


version=$(basename $(curl -s $TURL | egrep -o 'https?://\S+'  | cut -d\" -f1))
wget $DURL/$version/docker-compose-`uname -s`-`uname -m` 
chmod 755 docker-compose-`uname -s`-`uname -m`
