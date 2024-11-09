FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=hugin

ENV URL=https://github.com/prosyslab-warehouse/hugin-2021.1
ENV GIT_REPO_NAME=hugin-2021.1

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
