FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=xbuffy-3.3.bl.3

ENV URL=https://github.com/prosyslab-warehouse/xbuffy-3.3.bl.3
ENV GIT_REPO_NAME=xbuffy

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
