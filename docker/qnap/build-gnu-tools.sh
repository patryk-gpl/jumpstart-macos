#!/usr/bin/env bash

# shellcheck disable=SC1091
source /root/common.sh

yum install -y ncurses-devel

TOOLS=(
  "less#https://ftp.gnu.org/gnu/less/less-643.tar.gz#less-643"
  "find#https://ftp.gnu.org/gnu/findutils/findutils-4.9.0.tar.xz#findutils-4.9.0"
)

download_and_install "${TOOLS[@]}"
