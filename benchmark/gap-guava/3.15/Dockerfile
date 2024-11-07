FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=gap-guava

ENV URL=https://github.com/prosyslab-warehouse/gap-guava-3.15
ENV GIT_REPO_NAME=gap-guava-3.15

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
