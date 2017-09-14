FROM alpine:latest

RUN apk --update add firefox-esr
RUN rm -rf /tmp/*  /var/cache/apk/*

##RUN useradd web
##USER  web

ENTRYPOINT ["/usr/bin/firefox"]

