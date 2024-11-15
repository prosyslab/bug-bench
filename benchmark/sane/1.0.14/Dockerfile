FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=sane-1.0.14

ENV URL=https://github.com/prosyslab-warehouse/sane-1.0.14
ENV GIT_REPO_NAME=sane

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
