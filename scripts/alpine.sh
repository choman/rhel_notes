#!/bin/sh


docker pull reg2.local.net/lm/alpine
docker run -it --rm reg2.local.net/lm/alpine $@
