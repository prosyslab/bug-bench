FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=r-cran-lpsolve-5.6.15

ENV URL=https://github.com/prosyslab-warehouse/r-cran-lpsolve-5.6.15
ENV GIT_REPO_NAME=r-cran-lpsolve

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
