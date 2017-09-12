#!/usr/bin/bash

KICKSTART_IP=172.16.1.15
HARBOR_IP=172.16.1.40
HARBOR_HN="reg2 reg2.local.net"

DOCKER_URL=http://${KICKSTART_IP}/yum/docker/docker.repo
DOCKER72_DEPS_URL=http://${KICKSTART_IP}/yum/docker72deps/docker72deps.repo

VERSION=$(cut -d: -f5 /etc/system-release-cpe)



if [ $VERSION = "7.2" ]; then
   YUM_REPOS=/etc/yum.repos.d

   sudo wget -P $YUM_REPOS $DOCKER_URL
   sudo wget -P $YUM_REPOS $DOCKER72_DEPS_URL
   
else
   sudo yum-config-manager --add-repo $DOCKER_URL

fi


sudo yum install -y docker-ce docker-compose

sudo systemctl enable docker


#
# need something for all users
sudo usermod -a -G docker dcw_admin


echo "$HARBOR_IP   $HARBOR_HN" | sudo tee -a /etc/hosts



