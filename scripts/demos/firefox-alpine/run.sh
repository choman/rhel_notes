#!/bin/bash

app="reg2.local.net/lm/firefox-alpine"

docker image pull $app

xhost + local:docker

myfile=""
cwd="$(dirname $(pwd))"



if [ -n "$1" ]; then
    myfile=$(echo $1 | sed -e "s|$HOME|/root|g")
    echo $1
    echo $myfile
fi


if [ -n "$myfile" ]; then
    docker container run -it --rm -e DISPLAY=$DISPLAY \
        -v $HOME/Desktop:/root/Desktop \
        -v $HOME/Downloads:/root/Downloads \
        -v /media/sf_Downloads/rhel_notes/files:/root/Downloads2 \
        -v $cwd/files:/root/Files \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        $app "$myfile"
else
    docker container run -it --rm -e DISPLAY=$DISPLAY \
        -v $HOME/Desktop:/root/Desktop \
        -v $HOME/Downloads:/root/Downloads \
        -v /media/sf_Downloads/rhel_notes/files:/root/Downloads2 \
        -v $cwd/files:/root/Files \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        $app
fi

xhost - local:docker

