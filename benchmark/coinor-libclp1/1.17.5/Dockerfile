FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=coinor-libclp1

ENV URL=https://github.com/prosyslab-warehouse/coinor-libclp1-1.17.5
ENV GIT_REPO_NAME=coinor-libclp1-1.17.5

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
