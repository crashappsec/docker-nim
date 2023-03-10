# published as ghcr.io/crashappsec/nim:latest
# published as ghcr.io/crashappsec/nim:$NIM_VERSION

FROM ubuntu:jammy-20230126 AS compile-nim
ARG NIM_VERSION=1.6.10
ARG NIMBLE_VERSION=0.14.0

RUN apt-get update && \
        apt-get install -y gcc curl tar xz-utils git

RUN mkdir -p /src && \
        cd src && \
        curl -o /src/nim-$NIM_VERSION.tar.xz -sSf https://nim-lang.org/download/nim-$NIM_VERSION.tar.xz && \
        tar xJf nim-$NIM_VERSION.tar.xz

WORKDIR /src/nim-$NIM_VERSION

RUN /bin/sh build.sh
RUN bin/nim c koch
RUN ./koch boot -d:release
RUN ./koch tools

ENV PATH /src/nim-$NIM_VERSION/bin:$PATH
RUN bin/nimble install nimble@$NIMBLE_VERSION -y

RUN /bin/sh install.sh /opt
