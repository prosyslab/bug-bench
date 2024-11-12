FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=mdadm-4.2

ENV URL=https://github.com/prosyslab-warehouse/mdadm-4.2
ENV GIT_REPO_NAME=mdadm

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
