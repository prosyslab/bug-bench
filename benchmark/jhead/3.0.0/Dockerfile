FROM prosyslab/bug-bench-base

COPY build.sh $SRC
ENV PROGRAM=jhead

ENV URL=https://github.com/prosyslab-warehouse/jhead-3.0.0
ENV GIT_REPO_NAME=jhead-3.0.0

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
