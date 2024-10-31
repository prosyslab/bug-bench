FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=libpano13

ENV URL=https://github.com/prosyslab-warehouse/libpano13-2.9.19
ENV GIT_REPO_NAME=libpano13-2.9.19

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
