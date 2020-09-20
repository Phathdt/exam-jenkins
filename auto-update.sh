#!/bin/bash

IMAGE=$1
CONTAINER_NAME=$2
PORT=$3

CID=$(docker ps | grep $IMAGE | awk '{print $1}')

docker pull $IMAGE

for im in $CID
do
    LATEST=`docker inspect --format "{{.Id}}" $IMAGE`
    RUNNING=`docker inspect --format "{{.Image}}" $im`
    NAME=`docker inspect --format '{{.Name}}' $im | sed "s/\///g"`
    
    echo "Latest:" $LATEST
    echo "Running:" $RUNNING
    
    if [ "$LATEST" != "$RUNNING" ];then
        echo "upgrading $NAME"
        docker rm -f $NAME
        
        docker run --name $CONTAINER_NAME -d -p ${PORT}:${PORT} -e APP_VERSION="latest" -e HOST_NAME=$(hostname -f) ${IMAGE}:latest
    else
        echo "$NAME up to date"
    fi
done
