#!/bin/bash

IMAGE_NAME=kareemetaam/java-app:$1

#Pull the image from docker hub
docker pull $IMAGE_NAME

#Run a container of the pulled image
docker run -d --name java_app_$1 $IMAGE_NAME
