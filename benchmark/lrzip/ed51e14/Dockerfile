FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for lrzip
    git libtool libbz2-dev liblzo2-dev zlib1g-dev pkg-config

ENV PROGRAM=lrzip
ENV VERSION=ed51e14

RUN mkdir $PROGRAM

ENV URL=https://github.com/ckolivas/lrzip.git
ENV TAG_NAME="ed51e14"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git reset --hard $TAG_NAME

COPY build.sh $SRC