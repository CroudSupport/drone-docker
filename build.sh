#!/bin/bash

VERSION=${1:-"dev"}
FLAVOURS=${2:-"docker,ecr"}

docker run --rm -v "$PWD":/go/src/github.com/CroudSupport/drone-docker -w /go/src/github.com/CroudSupport/drone-docker golang:1.8 ./.drone.sh

for FLAVOUR in $(echo $FLAVOURS | sed "s/,/ /g")
do
    if [ $FLAVOUR = "docker" ] ; then
    DOCKERFILE_PATH="./docker/Dockerfile"
    else
        DOCKERFILE_PATH="./docker/$FLAVOUR/Dockerfile"
    fi

    if [ -f $DOCKERFILE_PATH ]; then
        IMAGE="croudtech/drone-docker:$FLAVOUR-$VERSION"
        echo "Building $IMAGE docker image"
        docker build . --file $DOCKERFILE_PATH -t $IMAGE
    fi

done

