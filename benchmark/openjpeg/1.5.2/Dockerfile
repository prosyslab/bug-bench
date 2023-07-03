FROM prosyslab/bug-bench-base
ENV VERSION=version.1.5.2
ENV GIT_REPO_NAME=openjpeg-1.5.2
RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake
COPY build.sh $SRC
ENV URL=https://github.com/uclouvain/openjpeg
ENV PROGRAM=openjpeg
RUN git clone $URL $GIT_REPO_NAME
RUN cd $PROGRAM; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
