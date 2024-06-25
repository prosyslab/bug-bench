FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo zlib1g-dev

ENV PROGRAM=MP4Box
ENV VERSION=0.7.1

RUN mkdir $PROGRAM

ENV URL=https://github.com/gpac/gpac/archive/refs/tags/v0.7.1.tar.gz

RUN wget $URL -O gpac-0.7.1.tar.gz
RUN tar -xzf gpac-0.7.1.tar.gz

COPY build.sh $SRC

WORKDIR gpac-0.7.1
