#!/bin/sh

# allow access to x server
xhost +local:root

# run the container
docker run -it \
  --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  ce-ubuntu-xf:latest

