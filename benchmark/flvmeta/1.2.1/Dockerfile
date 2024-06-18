FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget check cmake pandoc pkg-config

ENV PROGRAM=flvmeta
ENV VERSION=1.2.1

RUN mkdir $PROGRAM

ENV URL=https://github.com/noirotm/flvmeta/archive/refs/tags/v1.2.1.tar.gz

RUN wget $URL
RUN tar -xzf v1.2.1.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
