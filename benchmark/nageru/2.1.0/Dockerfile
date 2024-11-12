FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=nageru-2.1.0

ENV URL=https://github.com/prosyslab-warehouse/nageru-2.1.0
ENV GIT_REPO_NAME=nageru

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
