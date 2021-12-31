#!/bin/bash

DOCKER_NAME=ldl

docker run -it --name $DOCKER_NAME -u $(id -u $USER):$(id -g $USER) -v ~/build:/build ubuntu
