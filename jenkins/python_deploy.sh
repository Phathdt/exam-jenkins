#!/bin/bash

docker login -u phathdt379 -p $PASS

docker pull ${DOCKER_PYTHON_IMAGE}:latest

CID=$(docker ps | grep $DOCKER_PYTHON_IMAGE | awk '{print $1}')

for im in "${CID[@]}"
do
    echo "STOPPING $DOCKER_PYTHON_IMAGE - $im"
    docker rm -f $im
done

docker run -d -p 5000:5000 -e APP_VERSION="latest" -e HOST_NAME=$(hostname -f) ${DOCKER_PYTHON_IMAGE}:latest
