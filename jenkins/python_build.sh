#!/bin/bash

cd python

docker build -t ${DOCKER_PYTHON_IMAGE}:latest .
