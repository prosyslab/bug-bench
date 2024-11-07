FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=drawxtl

ENV URL=https://github.com/prosyslab-warehouse/drawxtl-5.5
ENV GIT_REPO_NAME=drawxtl-5.5

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
