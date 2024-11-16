FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=seaview-5.0.5

ENV URL=https://github.com/prosyslab-warehouse/seaview-5.0.5
ENV GIT_REPO_NAME=seaview

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
