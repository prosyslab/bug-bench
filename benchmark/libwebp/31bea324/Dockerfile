FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install libtool libjpeg-dev autoconf
ENV VERSION=31bea324
ENV PROGRAM=libwebp
ENV URL=https://github.com/webmproject/libwebp/
ENV GIT_REPO_NAME=libwebp-31bea324
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
