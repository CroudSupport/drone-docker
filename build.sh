#!/bin/bash

VERSION=${1:-"dev"}

echo "Building croudtech/drone-docker:$VERSION docker image"

docker run --rm -v "$PWD":/go/src/github.com/CroudSupport/drone-docker -w /go/src/github.com/CroudSupport/drone-docker golang:1.8 ./.drone.sh
docker build . --file ./docker/Dockerfile -t croudtech/drone-docker:$VERSION