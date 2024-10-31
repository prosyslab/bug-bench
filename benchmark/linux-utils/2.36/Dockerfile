FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=linux-utils

ENV URL=https://github.com/prosyslab-warehouse/linux-utils-2.36
ENV GIT_REPO_NAME=linux-utils-2.36

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
