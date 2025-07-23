FROM prosyslab/bug-bench-base

RUN apt-get update && \
    apt-get install -y wget cmake

ENV PROGRAM=InChI

ENV URL=https://github.com/IUPAC-InChI/InChI.git
ENV GIT_REPO_NAME=InChI-1.07.4

RUN git clone $URL
RUN cd $PROGRAM && git checkout a8f50e21d8affe91abee8749612ef5a107b80a18
RUN cd ..

COPY build.sh $SRC

WORKDIR $PROGRAM
