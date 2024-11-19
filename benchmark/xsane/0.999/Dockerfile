FROM prosyslab/bug-bench-base

RUN apt-get -y update
RUN apt-get -y install wget flex

COPY build.sh $SRC
ENV PROGRAM=xsane-0.999

ENV URL=https://github.com/prosyslab-warehouse/xsane-0.999
ENV GIT_REPO_NAME=xsane

RUN git clone $URL
RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
