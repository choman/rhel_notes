#!/bin/sh


docker pull reg2.local.net/lm/centos
docker run -it --rm reg2.local.net/lm/centos $@
