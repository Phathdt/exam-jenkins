#!/bin/bash

ssh slave

docker pull ${DOCKER_PYTHON_IMAGE}:latest

docker stop python || true && docker rm python || true

docker run --name python -d -p 5000:5000 -e APP_VERSION="lastest" -e HOST_NAME="Phathdts-MacBook-Pro.local" ${DOCKER_PYTHON_IMAGE}:latest