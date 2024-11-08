FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=gv

ENV URL=https://github.com/prosyslab-warehouse/gv-3.7.4.1
ENV GIT_REPO_NAME=gv-3.7.4.1

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
