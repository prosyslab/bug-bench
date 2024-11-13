FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=nickle-2.90

ENV URL=https://github.com/prosyslab-warehouse/nickle-2.90
ENV GIT_REPO_NAME=nickle

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
