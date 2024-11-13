FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=octave-nan-3.4.5

ENV URL=https://github.com/prosyslab-warehouse/octave-nan-3.4.5
ENV GIT_REPO_NAME=octave-nan

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
