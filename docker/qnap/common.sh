#!/usr/bin/env bash

DEST_DIR="/share/Public/tools"
BUILD_DIR="/root"

extract_file() {
  local filename=$1

  echo "Extracting $filename..."
  if [[ $filename =~ \.tar\.gz$ ]]; then
    tar zxf "$filename" -C $BUILD_DIR
  elif [[ $filename =~ \.tar\.xz$ ]]; then
    tar Jxf "$filename" -C $BUILD_DIR
  else
    echo "Unknown archive type for $filename, exiting..." && exit 1
  fi
}

configure_build_install() {
  local folder="$BUILD_DIR/$1"

  cd "$folder" || { echo "Unable to change directory to $folder, exiting..." && exit 1; }
  echo "WORK_DIR=$(pwd)"

  echo "Configuring..."
  ./configure --prefix="$DEST_DIR"

  echo "Building with make..."
  make

  echo "Installing with make install..."
  make install
  cd ..
}

download_and_install() {
  local tools=("$@")

  echo
  for tool in "${tools[@]}"; do
    IFS='#' read -r name url folder <<< "$tool"

    echo "Tool name: $name"
    echo "URL: $url"
    echo "Folder: $folder"
    echo

    if [ -e "$DEST_DIR/bin/$name" ]; then
      echo "File $DEST_DIR/bin/$name exists already. Skipping.."
      continue
    fi

    wget -c "$url" --no-check-certificate
    filename=$(basename "$url")

    if [ -f "$filename" ]; then
      extract_file "$filename"
      configure_build_install "$folder"
    else
      echo "File $filename does not exist. Aborting..."
      exit 1
    fi
  done
}
