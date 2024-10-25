#!/bin/sh
docker run --rm --name uvnc -it -p 5900:5900 -e PASSWD=password -e XRES=1280x800x24 ce-ubuntu-vnc:latest "entrypoint.sh && sh"
