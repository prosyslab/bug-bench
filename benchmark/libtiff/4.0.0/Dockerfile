FROM prosyslab/bug-bench-base
ENV $VERSION_NO=991404c
ENV VERSION=Release-v4-0-0
ENV PROGRAM=libtiff
ENV GIT_REPO_NAME=$PROGRAM-4.0.0

RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake
RUN cmake -DCMAKE_BUILD_TYPE=Release

RUN URL=https://github.com/vadz/libtiff

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
