FROM ubuntu:18.04

RUN apt-get update && \
    apt-get upgrade -y
RUN apt-get install -y make git gcc

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git clone https://github.com/prosyslab/smake.git

ENV SRC=/src
ENV OUT=/out
RUN mkdir -p $SRC $OUT/smake-out

ENV BUILD=/src/build.sh

ENV SMAKE_DIR=/smake
ENV SMAKE_BIN=$SMAKE_DIR/smake
ENV SMAKE_OUT=$OUT/smake-out

ENV INFER_DIR=/infer
ENV INFER_BIN=$INFER_DIR/infer/bin/infer

WORKDIR $SRC
