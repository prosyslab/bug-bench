FROM prosyslab/bug-bench-base

ENV PROGRAM=htmldoc
ENV URL=https://github.com/prosyslab-warehouse/$PROGRAM.git

COPY build.sh $SRC
COPY input $SRC/input

RUN git clone $URL

WORKDIR $PROGRAM

RUN git reset --hard b3f6ab
