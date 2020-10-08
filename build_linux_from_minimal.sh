#!/usr/bin/env bash

CONFIG_NAME=$1
IMAGE_TAG=$2

echo 2> context/.dockerignore
docker build -f "generated/linux/${CONFIG_NAME}/Ubuntu/18.04-sudo/Dockerfile" \
  -t ${IMAGE_TAG} "context"

docker push ${IMAGE_TAG}
