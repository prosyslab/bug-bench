FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=urjtag

RUN mkdir $PROGRAM

ENV URL=https://downloads.sourceforge.net/project/urjtag/urjtag/0.8/urjtag-0.8.tar.gz

RUN wget $URL
RUN tar -xzvf urjtag-0.8.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
