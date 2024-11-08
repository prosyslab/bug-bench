FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=grass

ENV URL=https://github.com/prosyslab-warehouse/grass-7.8.5
ENV GIT_REPO_NAME=grass-7.8.5

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
