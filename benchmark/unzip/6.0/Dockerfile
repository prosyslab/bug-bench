FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=unzip

RUN mkdir $PROGRAM

ENV URL=http://downloads.sourceforge.net/infozip/unzip60.tar.gz

RUN wget $URL
RUN tar -xzvf unzip60.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC
COPY Makefile.haechi $SRC/$PROGRAM/Makefile.haechi

WORKDIR $PROGRAM
