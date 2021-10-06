FROM prosyslab/bug-bench-base

ENV PROGRAM=sam2p
ENV URL=https://github.com/prosyslab-warehouse/$PROGRAM.git

COPY build.sh $SRC

RUN git clone $URL

WORKDIR $PROGRAM

RUN git reset --hard 6cbabd
