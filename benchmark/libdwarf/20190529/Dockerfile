FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf texinfo

RUN wget http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz && \
    tar -xzf automake-1.15.tar.gz && \
    cd automake-1.15 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf automake-1.15.tar.gz automake-1.15

ENV PROGRAM=dwarfdump

RUN mkdir $PROGRAM

ENV URL=https://github.com/davea42/libdwarf-code

RUN git clone $URL --depth 1 --branch 20190529 $PROGRAM

WORKDIR $PROGRAM

COPY build.sh $SRC
