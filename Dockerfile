FROM alpine
MAINTAINER Steve Jiang <steve.jiang@gmail.com>

ENV VERSION=2.3.1
VOLUME /geodata
COPY update.sh /usr/local/bin/update.sh
ENTRYPOINT ["update.sh"]

RUN apk add -q --update \
        bash \
        wget \
        build-base \
        openssh-client \
        ca-certificates \
        file \
        zlib-dev \
        curl-dev \
    && wget https://github.com/maxmind/geoipupdate/releases/download/v${VERSION}/geoipupdate-${VERSION}.tar.gz \
    && tar zxvf geoipupdate-${VERSION}.tar.gz \
    && cd geoipupdate-${VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf ./geoipupdate-${VERSION} \
    && rm -rf /var/cache/apk/*

