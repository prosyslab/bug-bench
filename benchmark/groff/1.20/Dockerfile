FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=groff

ENV URL=https://github.com/prosyslab-warehouse/groff-1.20
ENV GIT_REPO_NAME=groff-1.20

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
