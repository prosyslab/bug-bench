FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install libtool libjpeg-dev tzdata wget cmake
ENV VERSION=version.2.1
ENV PROGRAM=openjpeg
ENV URL=https://github.com/uclouvain/openjpeg/
ENV GIT_REPO_NAME=openjpeg-2.1.0
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
