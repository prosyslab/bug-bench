FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget automake pkg-config python-is-python3 libtool autogen
ENV VERSION=6b46656
ENV PROGRAM=libsndfile
ENV URL=https://github.com/erikd/libsndfile
ENV GIT_REPO_NAME=libsndfile-6b46656
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
