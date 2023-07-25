FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget libtool m4 automake bison flex
ENV VERSION=cc6a386
ENV PROGRAM=libming
ENV URL=https://github.com/libming/libming.git
ENV GIT_REPO_NAME=libming-cc6a386
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
