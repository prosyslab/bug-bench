FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=alsa-utils

ENV URL=https://github.com/prosyslab-warehouse/alsa-utils-1.2.4
ENV GIT_REPO_NAME=alsa-utils-1.2.4

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
