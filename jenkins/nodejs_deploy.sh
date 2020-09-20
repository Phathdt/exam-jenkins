#!/bin/bash

docker login -u phathdt379 -p $PASS

docker pull ${DOCKER_NODEJS_IMAGE}:latest

CID=$(docker ps | grep $DOCKER_NODEJS_IMAGE | awk '{print $1}')

for im in "${CID[@]}"
do
    echo "STOPPING $DOCKER_NODEJS_IMAGE - $im"
    docker rm -f $im
done

docker run -d -p 3000:3000 -e APP_VERSION="latest" -e HOST_NAME=$(hostname -f) ${DOCKER_NODEJS_IMAGE}:latest
