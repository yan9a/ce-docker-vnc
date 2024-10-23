#!/bin/sh
docker run --rm --name avnc -it -p 5900:5900 -e PASSWD=password -e XRES=1280x800x24 ce-alpine-vnc:latest "entrypoint.sh && sh"
