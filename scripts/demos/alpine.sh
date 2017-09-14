#!/bin/sh


docker image pull reg2.local.net/lm/alpine
docker container run -it --rm reg2.local.net/lm/alpine $@
