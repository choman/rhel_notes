#!/usr/bin/bash

echo "Login to reg2.local.net"
docker login -u choman reg2.local.net

for image in alpine hello-world ubuntu centos
do 
   docker image pull $image
   docker image tag  $image reg2.local.net/lm/$image
   docker image push reg2.local.net/lm/$image
done

