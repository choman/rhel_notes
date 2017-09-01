# Taditional Mounting and Passing

## As root
- sudo -s
- mount <server>:<data path> <dst>

## As user
- docker run -v <src>:<dst> --rm   -it ubuntu:17.04 bash
   - <src> is the mountpoint from the mount command
   - <dst> is the destination inside the container

# Docker Mounting and Passing

## As User
- docker run --mount 'type=volume,src=src_name4,dst=<dst>,volume-nocopy,volume-opt=type=nfs,volume-opt=device=<nfs_server>:<src>,"volume-opt=o=addr=<nfs_server>,vers=4,hard,timeo=600,rsize=1048576,wsize=1048576,retrans=2"' --rm   -it --name mycontainer2 ubuntu:17.04 bash
   - src=src_name4:  This is a docker related volume and
     should be different for each container.  maybe even runtime
   - dst=<dst>:  Replace <dst> with destination inside the container
   - device=<nfs_server>:<src>: Replace <nfs_server> with remote server
                                ip address (or hostname) and <src> with 
                                remote share
   - addr=<nfs_server>:  Replace <nfs_server> with remote server ip address
   - vers4 and on:  essentially mount options, tweakable



