FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

COPY build.sh $SRC

ENV PROGRAM=jhead
ENV VERSION=3.0.0

RUN mkdir $PROGRAM

ENV URL=http://deb.debian.org/debian/pool/main/j/jhead/jhead_3.00.orig.tar.gz

RUN wget $URL
RUN tar -xzvf jhead_3.00.orig.tar.gz -C $PROGRAM --strip-components 1

WORKDIR $PROGRAM
