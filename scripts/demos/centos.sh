#!/bin/sh


docker image pull reg2.local.net/lm/centos
docker container run -it --rm reg2.local.net/lm/centos $@
