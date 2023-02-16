FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for 32bit binary
    gcc-multilib

ENV PROGRAM=objdump
ENV VERSION=2.31.1

RUN mkdir $PROGRAM

ENV URL=http://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.gz

RUN wget $URL
RUN tar -xzf binutils-2.31.1.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
