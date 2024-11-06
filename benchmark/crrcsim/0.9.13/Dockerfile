FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=crrcsim

ENV URL=https://github.com/prosyslab-warehouse/crrcsim-0.9.13
ENV GIT_REPO_NAME=crrcsim-0.9.13

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
