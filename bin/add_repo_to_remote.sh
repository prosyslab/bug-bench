#!/bin/bash
# usage : add_repo_to_remote.sh [repo name] [url of tar file]

REPO_PATH=$1
REPO_NAME="${REPO_PATH##*/}"

URL=$2
FILE_NAME="${URL##*/}"
FILE_EXTENSION="${FILE_NAME##*.}"

if [ $FILE_EXTENSION = "gz" ]; then
    TAR_OPTION="-xzvf"
elif [ $FILE_EXTENSION = "xz" ]; then
    TAR_OPTION="-xvf"
else
    echo "Please give me the tar.gz or tar.xz file link!"
    exit 0
fi

mkdir /tmp/add_repo_to_remote
pushd /tmp/add_repo_to_remote

gh repo create $1 --private -y
wget $2
tar $TAR_OPTION $FILE_NAME -C $REPO_NAME --strip-components=1

pushd $REPO_NAME
git add --all
git commit -m "init"
git push origin master
popd

popd
rm -rf /tmp/add_repo_to_remote
