#!/bin/sh


docker pull reg2.local.net/lm/ubuntu
docker run -it --rm reg2.local.net/lm/ubuntu $@
