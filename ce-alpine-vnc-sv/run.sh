#!/bin/sh
docker run --rm --name avncsv -it -p 5900:5900 -e PASSWD=password -e XRES=1280x800x24 ce-alpine-x11vnc-sv:latest "entrypoint.sh && sh"
