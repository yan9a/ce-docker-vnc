FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    x11-apps \
    mesa-utils dbus-x11 \
    gnome-calculator \
    && rm -rf /var/lib/apt/lists/*

# DISPLAY environment variable for X11 forwarding
ENV DISPLAY=:0
ENV LIBGL_ALWAYS_SOFTWARE=1
CMD ["dbus-launch","gnome-calculator"]
