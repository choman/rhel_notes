#!/bin/sh


docker image pull reg2.local.net/lm/ubuntu
docker container run -it --rm reg2.local.net/lm/ubuntu $@
