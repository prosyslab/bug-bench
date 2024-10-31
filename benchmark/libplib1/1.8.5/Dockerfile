FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=libplib1

ENV URL=https://github.com/prosyslab-warehouse/libplib1-1.8.5
ENV GIT_REPO_NAME=libplib1-1.8.5

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
