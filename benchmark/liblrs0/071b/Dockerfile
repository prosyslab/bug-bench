FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=liblrs0-071b

ENV URL=https://github.com/prosyslab-warehouse/liblrs0-071b
ENV GIT_REPO_NAME=liblrs0

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
