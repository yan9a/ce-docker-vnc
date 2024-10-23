#!/bin/sh
docker run --rm --name utvnc -it -p 5900:5900 -e PASSWD=password -e XRES=1280x800 ce-ubuntu-tightvnc:latest "entrypoint.sh && sh"
