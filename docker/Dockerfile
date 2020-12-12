FROM ubuntu:18.04

# basic setting
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV SRC=/src
ENV OUT=/out
RUN mkdir -p $SRC $OUT/smake-out

ENV BUILD=/src/build.sh

ENV SMAKE_DIR=/smake
ENV SMAKE_BIN=$SMAKE_DIR/smake
ENV SMAKE_OUT=$OUT/smake-out

ENV INFER_DIR=/infer
ENV INFER_BIN=$INFER_DIR/infer/bin/infer

# for debian package build
ENV DEB_BUILD_OPTIONS="nocheck notest"
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
COPY build-deb.sh $SRC

RUN apt-get update && \
    apt-get upgrade -y
RUN apt-get install -y make git gcc tzdata bear dpkg-dev

RUN git clone https://github.com/prosyslab/smake.git

WORKDIR $SRC
