#!/bin/sh


chmod 755 docker-compose-Linux-x86_64

cp docker-compose-Linux-x86_64 rpm/BUILD/docker-compose-1.16.1-1.x86_64

rpmbuild -bb rpm/SPECS/docker-compose.spec
