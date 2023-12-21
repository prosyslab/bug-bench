FROM prosyslab/bug-bench-base

RUN apt-get update
RUN apt-get -y install wget pkg-config libtool autoconf

ENV PROGRAM=fribidi

RUN mkdir $PROGRAM

ENV URL=https://github.com/fribidi/fribidi.git

RUN git clone $URL

COPY build.sh $SRC

WORKDIR $PROGRAM
RUN git checkout v1.0.7