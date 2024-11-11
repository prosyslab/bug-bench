FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=lp-solve-5.5.2.5

ENV URL=https://github.com/prosyslab-warehouse/lp-solve-5.5.2.5
ENV GIT_REPO_NAME=lp-solve

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
