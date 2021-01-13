FROM prosyslab/bug-bench-base

RUN apt-get -y update

RUN apt-get -y install wget tzdata pkg-config autoconf intltool autopoint libtool libglib2.0-dev

COPY build.sh $SRC

ENV PROGRAM=autotrace

RUN mkdir $PROGRAM

ENV URL=https://github.com/autotrace/autotrace/archive/travis-20200219.65.tar.gz

RUN wget $URL
RUN tar -xvzf travis-20200219.65.tar.gz -C $PROGRAM --strip-components 1

WORKDIR $PROGRAM
