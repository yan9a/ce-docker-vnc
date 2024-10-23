FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies x11vnc dbus-x11 xfonts-base xinit xvfb \
    xserver-xorg x11-xserver-utils \
    openssh-server openssh-client nano \
    mesa-utils libgl1-mesa-dri x11-utils \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "root:${PASSWD}" | chpasswd && \
    mkdir /var/run/sshd

EXPOSE 5900 22

# Start VNC server
CMD ["/usr/local/bin/entrypoint.sh"]
ENTRYPOINT ["/bin/sh","-c"]
