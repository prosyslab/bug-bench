FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=wily-0.13.41

ENV URL=https://github.com/prosyslab-warehouse/wily-0.13.41
ENV GIT_REPO_NAME=wily

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
