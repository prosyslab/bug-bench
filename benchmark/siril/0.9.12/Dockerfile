FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=siril-0.9.12

ENV URL=https://github.com/prosyslab-warehouse/siril-0.9.12
ENV GIT_REPO_NAME=siril

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
