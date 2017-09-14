FROM ubuntu:17.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y firefox

RUN useradd web
USER  web

ENTRYPOINT ["/usr/bin/firefox"]

