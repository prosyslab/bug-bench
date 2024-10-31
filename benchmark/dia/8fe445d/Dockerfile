FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=dia

ENV URL=https://github.com/prosyslab-warehouse/dia-8fe445d
ENV GIT_REPO_NAME=dia-8fe445d

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
