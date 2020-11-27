FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install pkg-config autoconf intltool autopoint libtool libglib2.0-dev imagemagick libmagick++-dev libpstoedit-dev tzdata

COPY build.sh $SRC
ENV PROGRAM=autotrace

RUN mkdir $PROGRAM
WORKDIR $PROGRAM

ENV SHA=4333e37d5040881b19c2e1dad221f8e988419932

RUN git init && git remote add origin https://github.com/autotrace/autotrace && \
    git fetch --depth 1 origin $SHA && git checkout $SHA
RUN $SRC/build.sh
