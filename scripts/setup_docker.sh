#!/usr/bin/bash

KICKSTART_IP=10.0.2.10
HARBOR_IP=10.0.2.100

KICKSTART_IP=172.16.1.15
HARBOR_IP=172.16.1.40


HARBOR_HN="reg2 reg2.local.net"

DOCKER_URL=http://${KICKSTART_IP}/yum/docker/docker.repo
DOCKER72_DEPS_URL=http://${KICKSTART_IP}/yum/docker72deps/docker72deps.repo

VERSION=$(cut -d: -f5 /etc/system-release-cpe)
TYPE=$(cut -d: -f7 /etc/system-release-cpe)



if [ $VERSION = "7.2" ]; then
   YUM_REPOS=/etc/yum.repos.d

   sudo wget -P $YUM_REPOS $DOCKER_URL
   sudo wget -P $YUM_REPOS $DOCKER72_DEPS_URL
   
else
   sudo yum-config-manager --add-repo $DOCKER_URL

fi


sudo yum install -y docker-ce docker-compose


#
# need something for all users
sudo usermod -a -G docker dcw_admin


echo "$HARBOR_IP   $HARBOR_HN" | sudo tee -a /etc/hosts


if [ $TYPE = "server" ]; then
   cd ../certs
   ./make.sh

   if [ ! -d /data/cert ]; then
      sudo mkdir -p /data/cert
   fi
   sudo cp -v local.net.crt local.net.key /data/cert
   sudo cp -v local.net.crt /etc/pki/ca-trust/source/anchors/reg2.local.net.crt

else 
   scp dcw_admin@$HARBOR_IP:/home/dcw_admin/rhel_notes/certs/local.net.crt /tmp
   sudo cp -v /tmp/local.net.crt /etc/pki/ca-trust/source/anchors/reg2.local.net.crt

fi

sudo chmod 644 /etc/pki/ca-trust/source/anchors/reg2.local.net.crt

echo "updating trusts"
sudo update-ca-trust


echo "starting docker"
sudo systemctl enable docker
sleep 2
sudo systemctl start docker

