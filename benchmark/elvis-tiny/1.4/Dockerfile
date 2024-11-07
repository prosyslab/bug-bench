FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=elvis-tiny

ENV URL=https://github.com/prosyslab-warehouse/elvis-tiny-1.4
ENV GIT_REPO_NAME=elvis-tiny-1.4

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
