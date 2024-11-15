FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=scheme48-1.9.2

ENV URL=https://github.com/prosyslab-warehouse/scheme48-1.9.2
ENV GIT_REPO_NAME=scheme48

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
