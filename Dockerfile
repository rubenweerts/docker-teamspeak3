FROM alpine:latest

MAINTAINER aheil

ENV TS_VERSION LATEST
ENV LANG C.UTF-8

RUN apk update
RUN apk upgrade
RUN apk add bash ca-certificates python3 tar wget
RUN rm -rf /var/cache/apk/*
RUN adduser -D -H -u 1000 -s /bin/false teamspeak3
RUN mkdir /data
RUN chown teamspeak3:teamspeak3 /data

COPY get-version.sh /get-version
COPY start-teamspeak3.sh /start-teamspeak3

EXPOSE 9987/udp 10011 30033

USER teamspeak3
VOLUME /data
WORKDIR /data
CMD ["/start-teamspeak3"]

