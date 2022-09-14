FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for libming project
    libfreetype6 libfreetype6-dev git libtool bison flex pkg-config

ENV PROGRAM=swftophp
ENV VERSION=5009802

RUN mkdir $PROGRAM

ENV URL=https://github.com/libming/libming.git
ENV TAG_NAME="50098023446a5412efcfbd40552821a8cba983a6"

RUN git clone $URL $PROGRAM

WORKDIR $PROGRAM
RUN git checkout $TAG_NAME

COPY build.sh $SRC