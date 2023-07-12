FROM prosyslab/bug-bench-base
ENV VERSION=7720188
ENV GIT_REPO_NAME=openjpeg-7720188
RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake
COPY build.sh $SRC
ENV URL=https://github.com/uclouvain/openjpeg
ENV PROGRAM=openjpeg
RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
