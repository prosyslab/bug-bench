FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=crafty

ENV URL=https://github.com/prosyslab-warehouse/crafty-23.4
ENV GIT_REPO_NAME=crafty-23.4

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
