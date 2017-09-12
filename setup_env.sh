#!/usr/bin/bash

cd $HOME
git clone https://github.com/choman/yadm

sudo mkdir -pv /usr/local/man/man1
sudo cp -v yadm/yadm   /usr/local/bin/
sudo cp -v yadm/yadm.1 /usr/local/man/man1

yadm clone --no-bootstrap https://github.com/choman/dotfiles
yadm config local.class dcw
yadm bootstrap

