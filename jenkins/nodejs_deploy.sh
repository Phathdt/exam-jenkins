#!/bin/bash

ssh slave

docker pull ${DOCKER_NODEJS_IMAGE}:latest

docker stop nodejs || true && docker rm nodejs || true

docker run --name nodejs -d -p 3000:3000 -e APP_VERSION="lastest" -e HOST_NAME="Phathdts-MacBook-Pro.local" ${DOCKER_NODEJS_IMAGE}:latest
