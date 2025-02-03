FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=cflow

RUN mkdir $PROGRAM

ENV URL=https://ftp.gnu.org/gnu/cflow/cflow-1.6.tar.gz

RUN wget $URL
RUN tar -xvzf cflow-1.6.tar.gz -C $PROGRAM --strip-components 1

COPY build.sh $SRC

WORKDIR $PROGRAM