FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=xmorph-20240707

ENV URL=https://github.com/prosyslab-warehouse/xmorph-20240707
ENV GIT_REPO_NAME=xmorph

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
