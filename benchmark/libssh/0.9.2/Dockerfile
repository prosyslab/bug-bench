FROM prosyslab/bug-bench-base

# update the smake git repository
RUN cd $SMAKE_DIR && git pull
ENV SCMAKE_BIN=$SMAKE_DIR/scmake

# install dependencies
RUN apt-get -y update
RUN apt-get -y install cmake libssl-dev zlib1g-dev

COPY build.sh $SRC

ENV URL=https://github.com/prosyslab-warehouse/libssh-0.9.2.git
ENV PROGRAM=libssh-0.9.2

RUN git clone $URL

WORKDIR $PROGRAM
