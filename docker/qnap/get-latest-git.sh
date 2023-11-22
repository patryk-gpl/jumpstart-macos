#!/usr/bin/env bash

url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
latest_version=$(curl -s "$url" | grep 'git-2\.[0-9]\+\.[0-9]\+\.tar\.gz' | sed -n 's/.*<a href="\(.*\)".*/\1/p' | sort -V | tail -1)

echo "Latest version of Git: $latest_version"
