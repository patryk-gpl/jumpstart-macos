#!/usr/bin/env bash

GIT_VERSION="2.43.0"
GIT_ARCHIVE="git-${GIT_VERSION}.tar.gz"
DEST_DIR="/share/Public/tools"

if [ -e "$DEST_DIR/bin/git" ]; then
  echo "File $DEST_DIR/bin/git exists already. Aborting installation.."
  exit 0
fi

if [ ! -f $GIT_ARCHIVE ]; then
    wget https://mirrors.edge.kernel.org/pub/software/scm/git/$GIT_ARCHIVE --no-check-certificate
fi
if [ -d git-${GIT_VERSION} ]; then
    rm -rf git-${GIT_VERSION}
fi

echo "Extracting $GIT_ARCHIVE..."
time tar zxf $GIT_ARCHIVE

cd "git-${GIT_VERSION}" || {
  echo "Unable to change directory to git-${GIT_VERSION}, exiting..."
  exit 1
}

./configure --prefix=$DEST_DIR
make all
make install
