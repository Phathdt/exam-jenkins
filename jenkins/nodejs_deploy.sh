#!/bin/bash

docker login -u phathdt379 -p $PASS

docker pull ${DOCKER_NODEJS_IMAGE}:latest

CONTAINER=nodejs

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

if [ $? -eq 1 ]; then
    echo "'$CONTAINER' does not exist."
else
    /usr/bin/docker rm --force $CONTAINER
fi

docker run --name nodejs -d -p 3000:3000 -e APP_VERSION="lastest" -e HOST_NAME="Phathdts-MacBook-Pro.local" ${DOCKER_NODEJS_IMAGE}:latest
