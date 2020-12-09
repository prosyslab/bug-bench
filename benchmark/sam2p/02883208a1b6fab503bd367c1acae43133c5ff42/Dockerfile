FROM prosyslab/bug-bench-base

RUN apt-get -y update

ENV PROGRAM=sam2p

RUN mkdir $PROGRAM
WORKDIR $PROGRAM

ENV SHA=02883208a1b6fab503bd367c1acae43133c5ff42

RUN git init && git remote add origin https://github.com/pts/$PROGRAM && \
    git fetch --depth 1 origin $SHA && git checkout $SHA

COPY build.sh $SRC
