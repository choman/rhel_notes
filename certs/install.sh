#!/bin/sh

if [ ! -d /data/cert ]; then
   sudo mkdir -p /data/cert
fi

sudo cp -v local.net.crt local.net.key /data/cert
sudo cp -v local.net.crt /etc/pki/ca-trust/source/anchors/reg2.local.net.crt
sudo chmod 644 /etc/pki/ca-trust/source/anchors/reg2.local.net.crt

echo "updating trusts"
sudo update-ca-trust

echo "restarting docker"
sudo systemctl stop docker
sudo systemctl start docker

