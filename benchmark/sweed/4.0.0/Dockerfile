FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=sweed-3.2.1

ENV URL=https://github.com/prosyslab-warehouse/sweed-3.2.1
ENV GIT_REPO_NAME=sweed

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
