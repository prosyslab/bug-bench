FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=abyss

ENV URL=https://github.com/prosyslab-warehouse/abyss-2.3.1
ENV GIT_REPO_NAME=abyss-2.3.1

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
