FROM prosyslab/bug-bench-base:22.04

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=mupdf

RUN mkdir $PROGRAM

ENV URL=https://mupdf.com/downloads/archive/mupdf-1.12.0-source.tar.gz

RUN wget $URL
RUN tar -xvzf mupdf-1.12.0-source.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM