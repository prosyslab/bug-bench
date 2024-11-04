FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=4ti2

ENV URL=https://github.com/prosyslab-warehouse/4ti2-1.6.9
ENV GIT_REPO_NAME=4ti2-1.6.9

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
