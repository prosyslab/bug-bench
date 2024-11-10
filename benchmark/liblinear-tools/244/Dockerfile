FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=liblinear-tools-244

ENV URL=https://github.com/prosyslab-warehouse/liblinear-tools-244
ENV GIT_REPO_NAME=liblinear-tools

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
