FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=cron

ENV URL=https://github.com/prosyslab-warehouse/cron-3.0
ENV GIT_REPO_NAME=cron-3.0

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
