FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=ispell

ENV URL=https://github.com/prosyslab-warehouse/ispell-3.4.02
ENV GIT_REPO_NAME=ispell-3.4.02

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
