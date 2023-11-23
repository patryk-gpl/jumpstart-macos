#!/usr/bin/env bash

BASE_DIR=$(dirname "$0")
BUILD_SCRIPT_NAME="${1:-build-git.sh}"
BUILD_SCRIPT="${BASE_DIR}/${BUILD_SCRIPT_NAME}"
COMMON_SCRIPT="${BASE_DIR}/common.sh"
BUILD_IMAGE="patrykk/centos_tools:1.0.0"
DEST_DIR="/share/Public/tools"
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

if system-docker ps -a | grep -q "$CONTAINER_NAME"; then
  echo "Container '${CONTAINER_NAME}' exists. Removing..."
  system-docker rm -f "${CONTAINER_NAME}"
fi

system-docker run --name "$CONTAINER_NAME" --privileged -v "$DEST_DIR":"$DEST_DIR" -d "$BUILD_IMAGE"

files=("$BUILD_SCRIPT" "$COMMON_SCRIPT")
if [ ${#files[@]} -gt 0 ]; then
  for file in "${files[@]}"; do
    echo "Copy $file to $CONTAINER_NAME:/root/$file"
    system-docker cp "$file" "$CONTAINER_NAME:/root/$file"
  done
fi
system-docker exec -t "$CONTAINER_NAME" bash /root/"${BUILD_SCRIPT_NAME}"

if ! grep -q "$DEST_DIR" "$HOME/.profile"; then
  id
  pwd
  echo "export PATH=$DEST_DIR/bin:\$PATH" >> "$HOME/.profile"
fi

if [ -n "$(system-docker ps -q --filter "name=${CONTAINER_NAME}")" ]; then
  echo "Cleanup $CONTAINER_NAME"
  system-docker stop "$CONTAINER_NAME" && echo "Stopped" || echo "Stopped failed"
  system-docker rm "$CONTAINER_NAME"  && echo "Removed" || echo "Removed failed"
fi
