FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=libambix-0.1.2

ENV URL=https://github.com/prosyslab-warehouse/libambix-0.1.2
ENV GIT_REPO_NAME=libambix

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
