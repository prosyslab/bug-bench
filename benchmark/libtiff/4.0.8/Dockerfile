FROM prosyslab/bug-bench-base
ENV $VERSION_NO=4.0.8
ENV VERSION=Release-v4.0.8
ENV PROGRAM=libtiff
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO

RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake
RUN cmake -DCMAKE_BUILD_TYPE=Release

RUN URL=https://github.com/vadz/libtiff

RUN git clone $URL
RUN cd ${PROGRAM}; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
