FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install libtool libjpeg-dev autoconf
ENV VERSION=e37a0ea
ENV PROGRAM=libzip
ENV URL=https://github.com/nih-at/libzip
ENV GIT_REPO_NAME=libzip-1.2.0
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
