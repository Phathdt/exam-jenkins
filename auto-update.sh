#!/bin/bash

IMAGES=(phathdt379/nodejs-exam phathdt379/python-exam)

for IMAGE in "${IMAGES[@]}"
do
    echo "Progressing $IMAGE"
    
    CID=$(docker ps | grep $IMAGE | awk '{print $1}')
    
    for im in "${CID[@]}"
    do
        docker pull $IMAGE
        LATEST=`docker inspect --format "{{.Id}}" $IMAGE`
        RUNNING=`docker inspect --format "{{.Image}}" $im`
        
        echo "Latest:" $LATEST
        echo "Running:" $RUNNING
        
        if [ "$LATEST" != "$RUNNING" ];then
            echo "upgrading $image"
            docker rm -f $im
            
            if [[ "$IMAGE" = "phathdt379/nodejs-exam" ]]; then
                docker run -d -p 3000:3000 -e APP_VERSION="latest" -e HOST_NAME=$(hostname -f) ${IMAGE}:latest
            else
                docker run -d -p 5000:5000 -e APP_VERSION="latest" -e HOST_NAME=$(hostname -f) ${IMAGE}:latest
            fi
            
        else
            echo "$IMAGE up to date"
        fi
    done
done
