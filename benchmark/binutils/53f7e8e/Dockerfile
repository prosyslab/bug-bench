FROM prosyslab/bug-bench-base
ENV VERSION_NO=53f7e8e
ENV VERSION=53f7e8ea7fad1fcff1b58f4cbd74e192e0bcbc1d
ENV PROGRAM=binutils
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO
ENV URL=git://sourceware.org/git/binutils-gdb.git

RUN apt-get -y update
RUN wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/gcc-8_8.4.0-3ubuntu2_amd64.deb
RUN wget http://mirrors.edge.kernel.org/ubuntu/pool/universe/g/gcc-8/gcc-8-base_8.4.0-3ubuntu2_amd64.deb
RUN wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/libgcc-8-dev_8.4.0-3ubuntu2_amd64.deb
RUN wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/cpp-8_8.4.0-3ubuntu2_amd64.deb
RUN wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gcc-8/libmpx2_8.4.0-3ubuntu2_amd64.deb
RUN wget http://mirrors.kernel.org/ubuntu/pool/main/i/isl/libisl22_0.22.1-1_amd64.deb

RUN apt-get -y install texinfo bison flex ./libisl22_0.22.1-1_amd64.deb ./libmpx2_8.4.0-3ubuntu2_amd64.deb ./cpp-8_8.4.0-3ubuntu2_amd64.deb ./libgcc-8-dev_8.4.0-3ubuntu2_amd64.deb ./gcc-8-base_8.4.0-3ubuntu2_amd64.deb ./gcc-8_8.4.0-3ubuntu2_amd64.deb
RUN apt-get -y install texinfo

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM