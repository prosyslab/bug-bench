FROM prosyslab/bug-bench-base
ENV VERSION_NO=991404c
ENV VERSION=Release-991404c
ENV PROGRAM=libtiff
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO
ENV URL=https://github.com/vadz/libtiff

RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
