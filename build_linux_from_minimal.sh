#!/usr/bin/env bash

CONFIG_NAME=$1
IMAGE_TAG=$2

#echo 2> context/.dockerignore
#docker build -f "generated/linux/MinimalAgent/Ubuntu/18.04/Dockerfile" -t \
#  teamcity-minimal-agent:EAP-linux "context"

echo 2> context/.dockerignore
docker build -f "generated/linux/${CONFIG_NAME}/Ubuntu/18.04/Dockerfile" -t \
  ${IMAGE_TAG} "context"
