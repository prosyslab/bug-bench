FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install autoconf libtool libjpeg-dev
ENV VERSION=version-dee1b64
ENV PROGRAM=jasper
ENV URL=https://github.com/jasper-software/jasper
ENV GIT_REPO_NAME=jasper-dee1b64
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
