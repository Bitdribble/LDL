#!/bin/bash

DOCKER_NAME=ldl

# Is an instance already running?
if [[ $(docker ps --filter name=$DOCKER_NAME -aq) ]]; then
  docker exec -it $DOCKER_NAME bash
  exit 0
fi

docker run -it --name $DOCKER_NAME -u $(id -u $USER):$(id -g $USER) -v ~/build:/build ubuntu
