FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget automake pkg-config python libtool autogen

ENV PROGRAM=libsndfile
ENV VERSION=5206a9b
RUN mkdir $PROGRAM

ENV URL=https://github.com/libsndfile/libsndfile/

ENV GIT_REPO_NAME=libsndfile-5206a9b
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
