FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y evince


##RUN useradd bob
##USER bob

ENTRYPOINT ["/usr/bin/evince"]

