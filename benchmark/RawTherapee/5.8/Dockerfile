FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=RawTherapee-5.8

ENV URL=https://github.com/prosyslab-warehouse/RawTherapee-5.8
ENV GIT_REPO_NAME=RawTherapee

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
