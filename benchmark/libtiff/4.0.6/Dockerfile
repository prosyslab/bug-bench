FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install git vim


ENV PROGRAM=libtiff
ENV VERSION=4.0.6
COPY build.sh $SRC
COPY input $INPUT

ENV URL=https://github.com/prosyslab-warehouse/$PROGRAM-$VERSION

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
