#!/usr/bin/env bash

BASE_DIR=$(dirname "$0")
BUILD_SCRIPT_NAME="${1:-build-git.sh}"
BUILD_SCRIPT="${BASE_DIR}/${BUILD_SCRIPT_NAME}"
BUILD_IMAGE="patrykk/centos_systemd:1.0.1"
DEST_DIR="/share/Public/toolchain"
CONTAINER_NAME="builder"

# Main

if [ -n "$1" ]; then
  if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: $0 [build-script-name]"
    exit 0
  fi
else
  echo "No build script name provided. Using default: ${BUILD_SCRIPT_NAME}"
fi

mkdir -p "$DEST_DIR"

if ! system-docker ps | grep -q "$CONTAINER_NAME"; then
  system-docker run --name "$CONTAINER_NAME" --privileged -v "$DEST_DIR":"$DEST_DIR" -d "$BUILD_IMAGE"
fi

system-docker cp "${BUILD_SCRIPT}" "$CONTAINER_NAME:/root/${BUILD_SCRIPT_NAME}"
system-docker exec -t "$CONTAINER_NAME" bash /root/"${BUILD_SCRIPT_NAME}"

if ! grep -q "$DEST_DIR" "$HOME/.profile"; then
  id
  pwd
  echo "PATH=$DEST_DIR/bin:\$PATH" >> "$HOME/.profile"
fi

if [ -n "$(system-docker ps -q --filter "name=${CONTAINER_NAME}")" ]; then
  system-docker stop "$CONTAINER_NAME" && system-docker rm "$CONTAINER_NAME"
fi
