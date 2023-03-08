FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=gzip
ENV VERSION=1.2.4a

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/$PROGRAM/$PROGRAM-$VERSION.tar.gz

RUN wget $URL
RUN tar -xzvf $PROGRAM-$VERSION.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
