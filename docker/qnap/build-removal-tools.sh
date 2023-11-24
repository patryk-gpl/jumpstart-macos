#!/usr/bin/env bash

# shellcheck disable=SC1091
source /root/common.sh

yum install -y \
  m4 \
  ncurses-devel \
  nettle \
  pcre2-devel

# Format of the TOOLS
# tool name#url#installation folder name extracted from archive
TOOLS=(
  # "nettle#https://ftp.gnu.org/gnu/nettle/nettle-3.9.tar.gz#nettle-3.9"
  # "rdfind#https://github.com/pauldreik/rdfind/archive/refs/tags/releases/1.6.0.tar.gz#rdfind-releases-1.6.0"
  "fdupes#https://github.com/adrianlopezroche/fdupes/releases/download/v2.2.1/fdupes-2.2.1.tar.gz#fdupes-2.2.1"
)

#   "rmlint#https://github.com/sahib/rmlint/archive/refs/tags/v2.10.2.tar.gz#rmlint-2.10.2"

# Installing removal tools
download_and_install "${TOOLS[@]}"
