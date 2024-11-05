FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=coinor-libcgl1

ENV URL=https://github.com/prosyslab-warehouse/coinor-libcgl1-0.60.4
ENV GIT_REPO_NAME=coinor-libcgl1-0.60.4

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
