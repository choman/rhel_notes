#!/bin/sh

SERVER_IP=172.16.1.40
SERVER_HN="reg2 reg2.local.net"

echo "$SERVER_IP    $SERVER_HN" | sudo tee -a /etc/hosts

scp dcw_admin@$SERVER_IP:/home/dcw_admin/rhel_notes/certs/local.net.crt .

sudo cp -v local.net.crt /etc/pki/ca-trust/source/anchors/reg2.local.net.crt
sudo chmod 644 /etc/pki/ca-trust/source/anchors/reg2.local.net.crt

echo "updating trusts"
sudo update-ca-trust

echo "restarting docker"
sudo systemctl stop docker
sudo systemctl start docker

