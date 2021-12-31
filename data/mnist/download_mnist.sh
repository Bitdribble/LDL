#!/bin/bash

# cd to the script's directory
cd "$(dirname "$0")"

for file in train-images-idx3-ubyte train-labels-idx1-ubyte t10k-images-idx3-ubyte t10k-labels-idx1-ubyte; do
  if [[ ! -f ${file} ]]; then
    echo Downloading ${file}.gz
    curl http://yann.lecun.com/exdb/mnist/${file}.gz --output ${file}.gz
    gunzip ${file}.gz
  fi
done
