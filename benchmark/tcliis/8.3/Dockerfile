FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=tcliis-v8.3

ENV URL=https://github.com/prosyslab-warehouse/tcliis-v8.3
ENV GIT_REPO_NAME=tcliis

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
