#!/bin/sh -e

docker build -f Dockerfile_alpine -t bboedockergit .
# docker build -f Dockerfile_ubuntu -t bboedockergit .

docker run --rm -it -v "$(pwd):/a" --workdir /a bboedockergit
