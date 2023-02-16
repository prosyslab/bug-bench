FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for cjpeg
    unzip nasm cmake

ENV PROGRAM=cjpeg
ENV VERSION=1.5.90

RUN mkdir $PROGRAM

ENV URL=https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/$VERSION.zip

RUN wget $URL
RUN unzip $VERSION.zip
RUN mv libjpeg-turbo-$VERSION/* $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
