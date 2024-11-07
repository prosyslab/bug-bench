FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=dvbstreamer

ENV URL=https://github.com/prosyslab-warehouse/dvbstreamer-2.1.0
ENV GIT_REPO_NAME=dvbstreamer-2.1.0

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
