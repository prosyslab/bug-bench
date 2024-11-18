FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=vacation-3.3.3

ENV URL=https://github.com/prosyslab-warehouse/vacation-3.3.3
ENV GIT_REPO_NAME=vacation

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
