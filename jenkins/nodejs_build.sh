#!/bin/bash

cd nodejs

docker build -t ${DOCKER_NODEJS_IMAGE}:latest .
