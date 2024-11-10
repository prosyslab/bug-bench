FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=libkrb5support0-1.19.4

ENV URL=https://github.com/prosyslab-warehouse/libkrb5support0-1.19.4
ENV GIT_REPO_NAME=libkrb5support0

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
