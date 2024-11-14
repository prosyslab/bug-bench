FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=20200505dfsg0

ENV URL=https://github.com/prosyslab-warehouse/foo2zjs-20200505dfsg0
ENV GIT_REPO_NAME=foo2zjs

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
