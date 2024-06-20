FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget cmake libpcap-dev flex bison

ENV PROGRAM=tcpdump
ENV VERSION=4.9.2

RUN mkdir $PROGRAM

ENV URL=https://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz

RUN wget $URL
RUN tar -xzf tcpdump-4.9.2.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
