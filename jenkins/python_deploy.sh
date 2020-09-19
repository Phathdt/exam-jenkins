#!/bin/bash

ssh slave <<ENDSSH
  docker pull ${DOCKER_PYTHON_IMAGE}:latest

  CONTAINER=python

  RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

  if [ $? -eq 1 ]; then
      echo "'$CONTAINER' does not exist."
  else
      /usr/bin/docker rm --force $CONTAINER
  fi

  docker run --name python -d -p 5000:5000 -e APP_VERSION="lastest" -e HOST_NAME="Phathdts-MacBook-Pro.local" ${DOCKER_PYTHON_IMAGE}:latest
ENDSSH
