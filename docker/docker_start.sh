#!/bin/bash

DOCKER_CONTAINER_NAME=ldl
DOCKER_IMAGE=ldl
WORKING_DIR=/build/LDL

# Ensure a default display
if [[ -z ${DISPLAY} ]];then
  DISPLAY=":0"
fi

# Is an instance already running?
if [[ $(docker ps --filter name=$DOCKER_CONTAINER_NAME -aq) ]]; then
  # Open a shell on that instance
  docker start $DOCKER_CONTAINER_NAME >/dev/null 2>&1
  docker exec -it $DOCKER_CONTAINER_NAME /bin/bash
  exit 0
fi

# Create a new instance, but keep it detached (-d)
docker run \
       -it \
       -d \
       --name $DOCKER_CONTAINER_NAME \
       -v ~/build:/build \
       -w $WORKING_DIR \
       -e DISPLAY=${DISPLAY} \
       -e PYTHONPATH=$WORKING_DIR \
       $DOCKER_IMAGE

# Allow X connections
xhost +local:root 1>/dev/null 2>&1

# Attach to the instance
docker exec \
       -e DISPLAY=$DISPLAY \
       -it \
       --privileged \
       $DOCKER_CONTAINER_NAME \
       /bin/bash

# Disallow X connections
xhost -local:root 1>/dev/null 2>&1
