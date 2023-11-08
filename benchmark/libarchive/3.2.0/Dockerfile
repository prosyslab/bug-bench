FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install autoconf libtool libjpeg-dev wget zip

ENV PROGRAM=libarchive

ENV URL=https://libarchive.org/downloads/libarchive-3.2.0.zip
ENV GIT_REPO_NAME=libarchive-3.2.0

RUN wget https://libarchive.org/downloads/libarchive-3.2.0.zip
RUN unzip libarchive-3.2.0.zip
RUN rm libarchive-3.2.0.zip

RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC

WORKDIR $PROGRAM
