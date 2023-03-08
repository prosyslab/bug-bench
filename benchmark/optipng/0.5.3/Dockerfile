FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget

ENV PROGRAM=optipng

ENV URL=https://github.com/prosyslab-warehouse/optipng-0.5.3
ENV GIT_REPO_NAME=optipng-0.5.3

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

COPY build.sh $SRC
COPY clang.mak $SRC/optipng/src/scripts/clang.mak
COPY pngx.mak $SRC/optipng/lib/pngxtern/scripts/clang.mak
COPY png.mak $SRC/optipng/lib/libpng/scripts/makefile.clang

WORKDIR $PROGRAM
