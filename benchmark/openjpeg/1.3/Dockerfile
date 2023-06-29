FROM prosyslab/bug-bench-base
ENV VERSION=version.1.3
ENV GIT_REPO_NAME=openjpeg-1.3
RUN apt-get -y update
RUN apt-get -y install tzdata wget cmake
COPY build.sh $SRC
ENV URL=https://github.com/uclouvain/openjpeg
ENV PROGRAM=openjpeg
RUN git clone $URL
RUN cd $PROGRAM; git checkout $VERSION; cd ..
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
