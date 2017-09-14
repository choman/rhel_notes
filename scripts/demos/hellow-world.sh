#!/bin/sh


docker image pull reg2.local.net/lm/hello-world
docker container run -it --rm reg2.local.net/lm/hello-world
