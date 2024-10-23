FROM alpine:latest

# Install dependencies
RUN apk update && apk add --no-cache \
    bash sudo openssh nano tzdata \
    xvfb x11vnc xfce4 xfce4-terminal \
    xrdb xhost xrandr xset

RUN touch /root/.Xauthority
ENV XRES 1280x800x24
ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root
ENV PASSWD=password
ENV HOME="/root"
ENV DISPLAY=":0"
ENV TZ=Pacific/Auckland
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set VNC password
RUN mkdir -p /root/.vnc && \
    x11vnc -storepasswd "${PASSWD}" /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN sed -i -e 's/\r$//' /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/entrypoint.sh

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
&& echo "root:${PASSWD}" | chpasswd 

EXPOSE 5900 22

# Start VNC server
CMD ["/usr/local/bin/entrypoint.sh"]
ENTRYPOINT ["/bin/sh","-c"]
