FROM prosyslab/bug-bench-base
ENV VERSION_NO=db07dd61
ENV VERSION=Release-db07dd61
ENV PROGRAM=libxml2
ENV GIT_REPO_NAME=$PROGRAM-$VERSION_NO
ENV URL=https://gitlab.gnome.org/GNOME/libxml2.git

RUN apt-get -y update
RUN apt-get -y install python3-capstone cmake

RUN git clone $URL $GIT_REPO_NAME
RUN cd $GIT_REPO_NAME; git checkout $VERSION; cd ..

RUN mv $GIT_REPO_NAME $PROGRAM

WORKDIR $PROGRAM
