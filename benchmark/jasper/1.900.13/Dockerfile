FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install autoconf libtool libjpeg-dev
ENV VERSION=version-1.900.13
ENV PROGRAM=jasper
ENV URL=https://github.com/jasper-software/jasper
ENV GIT_REPO_NAME=jasper-1.900.13
RUN git clone $URL $GIT_REPO_NAME
RUN cd $PROGRAM; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
