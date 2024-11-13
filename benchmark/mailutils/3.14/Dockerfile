FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=mailutils-3.14

ENV URL=https://github.com/prosyslab-warehouse/mailutils-3.14
ENV GIT_REPO_NAME=mailutils

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
