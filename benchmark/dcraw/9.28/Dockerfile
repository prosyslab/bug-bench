FROM prosyslab/bug-bench-base

ENV PROGRAM=dcraw
ENV URL=https://github.com/prosyslab-warehouse/$PROGRAM.git

# build-deb.sh
RUN apt update -y && apt upgrade -y
RUN apt source $PROGRAM
RUN apt build-dep -y $PROGRAM

COPY build.sh $SRC
COPY input $SRC/input

RUN git clone $URL

WORKDIR $PROGRAM

RUN git reset --hard 39db1b
