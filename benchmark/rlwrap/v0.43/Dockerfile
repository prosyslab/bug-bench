FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=rlwrap-0.43

ENV URL=https://github.com/prosyslab-warehouse/rlwrap-0.43
ENV GIT_REPO_NAME=rlwrap

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
