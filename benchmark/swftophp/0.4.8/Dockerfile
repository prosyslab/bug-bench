FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for libming project
    libfreetype6 libfreetype6-dev git libtool bison flex

ENV PROGRAM=swftophp
ENV VERSION=0.4.8

RUN mkdir $PROGRAM

ENV URL=https://github.com/libming/libming.git
ENV TAG_NAME="ming-0_4_8"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git checkout $TAG_NAME

COPY build.sh $SRC