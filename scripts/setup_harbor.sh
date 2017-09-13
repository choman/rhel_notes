#!/usr/bin/bash

KICKSTART_IP=172.16.1.15
HARBOR_IP=172.16.1.40
HARBOR_HN="reg2 reg2.local.net"

WITH_CLAIR=true
WITH_NOTARY=true

DOCKER_URL=http://${KICKSTART_IP}/yum/docker/docker.repo
DOCKER72_DEPS_URL=http://${KICKSTART_IP}/yum/docker72deps/docker72deps.repo

VERSION=$(cut -d: -f5 /etc/system-release-cpe)
TYPE=$(cut -d: -f7 /etc/system-release-cpe)


FLAGS=""

if $WITH_CLAIR; 
then
   FLAGS="--with-clair "
fi

if $WITH_NOTARY;
then
   FLAGS="--with-notary "
fi

su dcw_admin
#newgrp docker

#
# to replace with --> yum install harbor 
cd $HOME
cd /opt
sudo wget -c -N http://${KICKSTART_IP}/yum/harbor/harbor-offline-installer-v1.2.0.tgz


# extract files
sudo tar xpf harbor-offline-installer-v1.2.0.tgz


# let's goto work
cd harbor
sudo rm harbor.cfg
sudo wget -c -N http://${KICKSTART_IP}/yum/harbor/harbor.cfg
sudo ./install.sh $FLAGS

