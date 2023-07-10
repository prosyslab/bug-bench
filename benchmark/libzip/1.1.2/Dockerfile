FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install libtool libjpeg-dev autoconf
ENV VERSION=rel-1-1-2
ENV PROGRAM=libzip
ENV URL=https://github.com/nih-at/libzip
ENV GIT_REPO_NAME=libzip-1.1.2
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
