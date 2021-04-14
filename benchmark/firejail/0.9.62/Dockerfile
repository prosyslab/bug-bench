FROM prosyslab/bug-bench-base

RUN apt-get -y update

COPY build.sh $SRC
ENV PROGRAM=firejail

ENV URL=https://github.com/prosyslab-warehouse/firejail-0.9.62
ENV GIT_REPO_NAME=firejail-0.9.62

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
