FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

COPY build.sh $SRC

ENV PROGRAM=binutils
ENV VERSION=2.24

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/$PROGRAM/$PROGRAM-$VERSION.tar.gz

RUN wget $URL
RUN tar -xzvf $PROGRAM-$VERSION.tar.gz -C $PROGRAM --strip-components 1

WORKDIR $PROGRAM
