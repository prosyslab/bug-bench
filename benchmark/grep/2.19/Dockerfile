FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget xz-utils

ENV PROGRAM=grep

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/grep/grep-2.19.tar.xz

RUN wget $URL
RUN tar -xvf grep-2.19.tar.xz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
