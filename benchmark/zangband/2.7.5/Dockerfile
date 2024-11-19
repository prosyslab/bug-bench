FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=zangband-2.7.5

ENV URL=https://github.com/prosyslab-warehouse/zangband-2.7.5
ENV GIT_REPO_NAME=zangband

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
