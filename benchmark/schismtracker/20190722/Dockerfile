FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget autoconf libsdl1.2-dev

ENV PROGRAM=schismtracker

ENV URL=https://github.com/prosyslab-warehouse/schismtracker-20190722.git
ENV GIT_REPO_NAME=schismtracker-20190722

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
