FROM debian:wheezy

MAINTAINER aheil

ENV DEBIAN_FRONTEND noninteractive
ENV TS_VERSION LATEST

RUN apt-get update \
    && apt-get -y install libmozjs-24-bin wget \
    && update-alternatives --install /usr/bin/js js /usr/bin/js24 100

RUN wget -O /usr/bin/jsawk https://github.com/micha/jsawk/raw/master/jsawk \
    && chmod +x /usr/bin/jsawk

RUN useradd -M -s /bin/false --uid 1000 teamspeak3 \
    && mkdir /data \
    && chown teamspeak3:teamspeak3 /data

ADD start-teamspeak3.sh /start-teamspeak3

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

USER teamspeak3
VOLUME ['/data']
WORKDIR /data
CMD ["/start-teamspeak3"]

