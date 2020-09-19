#!/bin/bash

DOCKER_IMAGE=$1
CONTAINER_NAME=$2
PORT=$3
REMOTE_SHA=$(curl https://registry.hub.docker.com/v2/repositories/$DOCKER_IMAGE/tags/latest | jq -r '."images"[]["digest"]')
LOCAL_SHA=$(docker inspect --format='{{index .RepoDigests 0}}'  $DOCKER_IMAGE )

if [[ "$DOCKER_IMAGE@$REMOTE_SHA" == "$LOCAL_SHA" ]]; then
    echo "Match"
else
    echo "have a new image, let pull"
    
    docker pull ${DOCKER_IMAGE}:latest
    
    RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER_NAME 2> /dev/null)
    
    if [ $? -eq 1 ]; then
        echo "'$CONTAINER_NAME' does not exist."
    else
        /usr/bin/docker rm --force $CONTAINER_NAME
    fi
    
    docker run --name $CONTAINER_NAME -d -p ${PORT}:${PORT} -e APP_VERSION="latest" -e HOST_NAME=$(hostname -f) ${DOCKER_IMAGE}:latest
fi
