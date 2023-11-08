FROM prosyslab/bug-bench-base
ENV VERSION_NO=3212005
ENV VERSION=3212005
ENV PROGRAM=libjpeg
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO
ENV URL=https://github.com/libjpeg-turbo/libjpeg-turbo.git

RUN apt-get -y update
RUN apt-get -y install nasm

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM