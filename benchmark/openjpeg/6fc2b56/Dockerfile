FROM prosyslab/bug-bench-base
ENV VERSION=6fc2b56
ENV GIT_REPO_NAME=openjpeg-6fc2b56
RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake libtiff-dev libtiff-tools
COPY build.sh $SRC
ENV URL=https://github.com/uclouvain/openjpeg
ENV PROGRAM=openjpeg
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
