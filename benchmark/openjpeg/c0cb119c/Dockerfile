FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install libtool libjpeg-dev tzdata wget cmake
ENV VERSION=c0cb119c
ENV PROGRAM=openjpeg
ENV URL=https://github.com/uclouvain/openjpeg/
ENV GIT_REPO_NAME=openjpeg-c0cb119c
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
