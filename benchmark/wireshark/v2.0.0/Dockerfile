FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=wireshark-2.0.0

ENV URL=https://github.com/prosyslab-warehouse/wireshark-2.0.0
ENV GIT_REPO_NAME=wireshark

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
