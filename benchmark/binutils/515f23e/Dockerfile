FROM prosyslab/bug-bench-base
ENV $VERSION_NO=53f7e8e
ENV VERSION=53f7e8ea7fad1fcff1b58f4cbd74e192e0bcbc1d
ENV PROGRAM=binutils
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO

RUN apt-get -y update
RUN apt-get -y install texinfo

RUN URL=git://sourceware.org/git/binutils-gdb.git

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM