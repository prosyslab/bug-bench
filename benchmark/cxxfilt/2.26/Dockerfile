FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo

ENV PROGRAM=cxxfilt
ENV VERSION=2.26

RUN mkdir $PROGRAM

ENV URL=http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz

RUN wget $URL
RUN tar -xzf binutils-2.26.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
