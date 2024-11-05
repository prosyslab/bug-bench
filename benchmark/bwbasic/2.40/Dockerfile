FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=bwbasic

ENV URL=https://github.com/prosyslab-warehouse/bwbasic-2.40
ENV GIT_REPO_NAME=bwbasic-2.40

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
