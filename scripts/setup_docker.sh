#!/usr/bin/bash

KICKSTART_IP=172.16.1.15
HARBOR_IP=172.16.1.40
HARBOR_HN="reg2 reg2.local.net"

DOCKER_URL=http://${KICKSTART_IP}/yum/docker/docker.repo
DOCKER72_DEPS_URL=http://${KICKSTART_IP}/yum/docker72deps/docker72deps.repo

VERSION=$(cut -d: -f5 /etc/system-release-cpe)


sudo yum-config-manager --add-repo $DOCKER_URL

if [ $VERSION = "7.2" ]; then
   sudo yum-config-manager --add-repo $DOCKER72_DEPS_URL
fi


sudo yum install -y docker-ce docker-compose

sudo systemctl enable docker


#
# need something for all users
sudo usermod -a -G docker dcw_admin


echo "$HARBOR_IP   $HARBOR_HN" | sudo tee -a /etc/hosts



