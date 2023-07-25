FROM prosyslab/bug-bench-base
ENV $VERSION_NO=4ea74a44
ENV VERSION=4ea74a44
ENV PROGRAM=libxml2
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO

RUN apt-get -y update
RUN apt-get -y install python-dev
RUN cmake -DCMAKE_BUILD_TYPE=Release

RUN URL=https://gitlab.gnome.org/GNOME/libxml2.git

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
