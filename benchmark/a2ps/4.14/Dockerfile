FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget gperf

ENV PROGRAM=a2ps

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/a2ps/a2ps-4.14.tar.gz

RUN wget $URL
RUN tar -xvzf a2ps-4.14.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM
