FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=nasm
ENV VERSION=2.14rc4

RUN mkdir $PROGRAM

ENV URL=https://www.nasm.us/pub/nasm/releasebuilds/2.14rc4/nasm-2.14rc4.tar.gz

RUN wget $URL
RUN tar -xzf nasm-2.14rc4.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
