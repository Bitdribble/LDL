#!/bin/bash

DOCKER_NAME=ldl

docker ps --filter name=$DOCKER_NAME -aq | xargs docker rm
