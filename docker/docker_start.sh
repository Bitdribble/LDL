#!/bin/bash

DOCKER_CONTAINER_NAME=ldl
DOCKER_IMAGE=ldl
DOCKER_HOSTNAME=ldl
WORKING_DIR=/build/LDL
# $USER is set up by the shell
USER_ID=$(id -u)
GRP=$(id -g -n)
GRP_ID=$(id -g)

# Ensure a default display
if [[ -z ${DISPLAY} ]];then
  DISPLAY=":0"
fi

# Is an instance already running?
if [[ $(docker ps --filter name=$DOCKER_CONTAINER_NAME -aq) ]]; then
  # Open a shell on that instance
  docker start $DOCKER_CONTAINER_NAME >/dev/null 2>&1
  docker exec -u $USER -it $DOCKER_CONTAINER_NAME /bin/bash
  exit 0
fi

# Create a new instance, but keep it detached (-d)
docker run \
  -it \
  -d \
  --name $DOCKER_CONTAINER_NAME \
  -v ~/build:/build \
  -w $WORKING_DIR \
  -e DISPLAY=$DISPLAY \
  -e PYTHONPATH=$WORKING_DIR \
  --hostname $DOCKER_HOSTNAME \
  $DOCKER_IMAGE

# Set up user and group
if [[ "${USER}" != "root" ]]; then
  docker exec $DOCKER_CONTAINER_NAME addgroup --force-badname --gid "${GRP_ID}" "${GRP}" >/dev/null
  docker exec $DOCKER_CONTAINER_NAME adduser --force-badname --disabled-password --gecos '' $USER --uid $USER_ID --gid $GRP_ID >/dev/null
  docker exec $DOCKER_CONTAINER_NAME usermod -aG sudo $USER >/dev/null
  docker exec $DOCKER_CONTAINER_NAME bash -c "echo '%sudo ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers"
fi

# Allow X connections
xhost +local:root 1>/dev/null 2>&1

# Attach to the instance
docker exec \
  -e DISPLAY=$DISPLAY \
  -it \
  --privileged \
  -u $USER \
  $DOCKER_CONTAINER_NAME \
  /bin/bash

# Disallow X connections
xhost -local:root 1>/dev/null 2>&1
