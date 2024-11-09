FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=libfreeimage3

ENV URL=https://github.com/prosyslab-warehouse/libfreeimage3-3.18.0
ENV GIT_REPO_NAME=libfreeimage3-3.18.0

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
