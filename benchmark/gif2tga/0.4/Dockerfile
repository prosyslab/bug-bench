FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget libsdl1.2-dev

ENV PROGRAM=gif2tga
ENV VERSION=0.4

RUN mkdir $PROGRAM

ENV URL=https://github.com/miniupnp/ngiflib/archive/refs/tags/0.4.tar.gz

RUN wget $URL
RUN tar -xzf 0.4.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
