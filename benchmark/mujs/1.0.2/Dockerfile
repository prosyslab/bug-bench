FROM prosyslab/bug-bench-base:22.04

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=mujs

RUN mkdir $PROGRAM

ENV URL=https://mujs.com/downloads/mujs-1.0.2.tar.gz

RUN wget $URL
RUN tar -xvzf mujs-1.0.2.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
