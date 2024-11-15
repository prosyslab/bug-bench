FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=rtcw-1.5.1

ENV URL=https://github.com/prosyslab-warehouse/rtcw-1.5.1
ENV GIT_REPO_NAME=rtcw

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
