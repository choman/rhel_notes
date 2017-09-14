#!/usr/bin/bash

cd /opt/harbor
/usr/bin/docker-compose -f docker-compose.yml -f docker-compose.notary.yml start
##-f docker-compose.clair.yml -f docker-compose.notary.yml start

