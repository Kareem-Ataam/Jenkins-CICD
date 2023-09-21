#!/bin/bash

IMAGE_NAME=kareemetaam/java-app:$1

docker pull $IMAGE_NAME

docker run -d --name java_app_$1 $IMAGE_NAME
