FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=minidlna-1.0.22

ENV URL=https://github.com/prosyslab-warehouse/minidlna-1.0.22
ENV GIT_REPO_NAME=minidlna

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
