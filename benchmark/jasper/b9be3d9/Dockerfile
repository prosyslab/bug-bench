FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install autoconf libtool libjpeg-dev

ENV PROGRAM=jasper

ENV URL=https://github.com/jasper-software/jasper
ENV GIT_REPO_NAME=jasper-b9be3d9

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout b9be3d9; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
