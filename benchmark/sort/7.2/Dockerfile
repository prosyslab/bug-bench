FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

COPY build.sh $SRC

ENV PROGRAM=sort
ENV VERSION=7.2

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/coreutils/coreutils-$VERSION.tar.gz
ENV PATCH=https://raw.githubusercontent.com/coreutils/coreutils/master/scripts/build-older-versions/coreutils-7.2-on-glibc-2.28.diff

RUN wget $URL
RUN tar -xzvf coreutils-$VERSION.tar.gz -C $PROGRAM --strip-components 1

RUN wget $PATCH
RUN cd $PROGRAM && patch -p1 < ../coreutils-7.2-on-glibc-2.28.diff

WORKDIR $PROGRAM
