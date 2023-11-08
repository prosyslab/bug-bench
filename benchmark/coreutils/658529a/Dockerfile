FROM prosyslab/bug-bench-base
ENV VERSION_NO=658529a
ENV VERSION=658529a
ENV PROGRAM=coreutils
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO
ENV URL=https://github.com/coreutils/coreutils.git

RUN apt-get -y update
RUN apt-get -y install autoconf automake bison gettext gperf gzip perl rsync tar texinfo autopoint

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM