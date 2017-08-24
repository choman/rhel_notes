#!/bin/sh

cd certs
./install.sh

cd
tar xvpf /media/sf_Downloads/rhel_notes/harbor-offline-installer-v1.2.0-rc2.tgz
cd harbor
cp /media/sf_Downloads/rhel_notes/files/harbor.cfg .
sudo ./install.sh --with-clair

