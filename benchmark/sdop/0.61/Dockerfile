FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

COPY build.sh $SRC

ENV PROGRAM=sdop
ENV VERSION=0.61

RUN mkdir $PROGRAM

ENV URL=https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/sdop/0.61-2/sdop_0.61.orig.tar.gz

RUN wget $URL
RUN tar -xzvf sdop_$VERSION.orig.tar.gz -C $PROGRAM --strip-components 1

WORKDIR $PROGRAM
