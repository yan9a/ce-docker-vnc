#!/bin/sh
docker run --rm --name uvncsv -it \
  -e PASSWD=password -e XRES=1280x800x24 \
  ce-ubuntu-vnc-sv:latest "entrypoint.sh && sh"
