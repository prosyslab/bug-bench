FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=sa-exim-4.2.1

ENV URL=https://github.com/prosyslab-warehouse/sa-exim-4.2.1
ENV GIT_REPO_NAME=sa-exim

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
