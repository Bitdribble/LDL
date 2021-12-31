#!/bin/bash

DOCKER_NAME=ldl

# Is an instance already running?
if [[ $(docker ps --filter name=$DOCKER_NAME -aq) ]]; then
  # Open a shell on that instance
  docker start $DOCKER_NAME >/dev/null 2>&1
  docker exec -it $DOCKER_NAME bash
  exit 0
fi

# Create a brand new instance
docker run -it --name $DOCKER_NAME -u $(id -u $USER):$(id -g $USER) -v ~/build:/build ubuntu
