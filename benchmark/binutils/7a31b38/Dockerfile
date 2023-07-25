FROM prosyslab/bug-bench-base
ENV $VERSION_NO=7a31b38
ENV VERSION=7a31b38ef87d133d8204cae67a97f1989d25fa18
ENV PROGRAM=binutils
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO

RUN apt-get -y update
RUN apt-get -y install texinfo

RUN URL=git://sourceware.org/git/binutils-gdb.git

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM