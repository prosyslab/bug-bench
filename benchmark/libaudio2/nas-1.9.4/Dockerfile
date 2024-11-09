FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=libaudio2

ENV URL=https://github.com/prosyslab-warehouse/libaudio2-1.4.2a
ENV GIT_REPO_NAME=libaudio2-1.4.2a

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
