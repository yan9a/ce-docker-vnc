# ce-docker-vnc
Docker images with VNC

## ce-alpine-vnc 

Docker image with x11vnc on alpine.

## ce-ubuntu-vnc 

Docker image with x11vnc on ubuntu.

## ce-ubuntu-tightvnc 

Docker image with tightvnc server on ubuntu.

## SSH Tunneling


To open ssh tunnel to localhost:5900 and forward to 5901 port, you can use the following command. Replace 172.17.0.2 with the IP address of running docker container.

```
ssh -L 5901:localhost:5900 -N -f -l root 172.17.0.2
```

And use 

```
localhost:5901
```

on the vnc client.

To shutdown the tunnel, you can use

```
pkill -f "ssh -L 5901"
```
