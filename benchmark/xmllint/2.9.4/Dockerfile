FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo \
    # for libxml
    unzip python-dev libtool pkg-config

ENV PROGRAM=xmllint
ENV VERSION=2.9.4

RUN mkdir $PROGRAM

ENV URL=https://github.com/GNOME/libxml2/archive/refs/tags/v2.9.4.zip

RUN wget $URL -O $PROGRAM.zip
RUN unzip $PROGRAM.zip
RUN mv /src/libxml2-2.9.4/* $PROGRAM
WORKDIR $PROGRAM

COPY build.sh $SRC