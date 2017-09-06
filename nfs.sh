#!/usr/bin/sh

DST=/mnt
NFS_SERVER=172.16.5.62
NFS_PATH=/exports


docker run --mount 'type=volume,src=src_name4,dst=/mnt,volume-nocopy,volume-opt=type=nfs,volume-opt=device=172.16.5.62:/exports,"volume-opt=o=addr=172.16.5.62,vers=4,hard,timeo=600,rsize=1048576,wsize=1048576,retrans=2"' --rm   -it --name mycontainer2 ubuntu:17.04 bash



