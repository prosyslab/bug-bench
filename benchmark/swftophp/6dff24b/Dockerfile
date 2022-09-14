FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for libming project
    libfreetype6 libfreetype6-dev git libtool bison flex

ENV PROGRAM=swftophp
ENV VERSION=6dff24b

RUN mkdir $PROGRAM

ENV URL=https://github.com/libming/libming.git
ENV TAG_NAME="6dff24bc2543c55f277662144d0cec97e4a6d0c1"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git checkout $TAG_NAME

COPY build.sh $SRC