FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies tightvncserver dbus-x11 xfonts-base \
    openssh-server openssh-client nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch /root/.Xauthority
ENV XRES 1280x800
ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root
ENV PASSWD=password
ENV HOME="/root"
ENV DISPLAY=":0"
ENV TZ=Pacific/Auckland
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set VNC password
RUN mkdir /root/.vnc && \
    echo "$PASSWD" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

COPY ./xstartup.sh /root/.vnc/xstartup
RUN sed -i -e 's/\r$//' /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

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
