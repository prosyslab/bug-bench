FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf

COPY build.sh $SRC

ENV PROGRAM=wget

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/wget/wget-1.12.tar.gz

RUN wget $URL
RUN tar -xzvf wget-1.12.tar.gz -C $PROGRAM --strip-components 1
RUN sed -i 's/AM_INIT_AUTOMAKE(dist-bzip2 dist-lzma 1.9)/AM_INIT_AUTOMAKE(1.9)/' wget/configure.ac

WORKDIR $PROGRAM
