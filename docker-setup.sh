#!/bin/bash

# -------------------------------------------------------------------
# install docker
echo "Installing docker"
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y --no-install-recommends ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources: ubuntu with debian accordingly
if lsb_release -a | grep Debian; then
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
else
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

sudo apt update && sudo apt  install -y --no-install-recommends \
  docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# check
# sudo docker run hello-world

# echo "Group add docker"
# sudo groupadd docker || true

echo "Add user to docker group"
sudo usermod -aG docker $USER || true
# relogin or use -
newgrp docker

#check without sudo
# docker run hello-world

# -------------------------------------------------------------------
# create network and allow local root for X11 forwarding
# echo "Create mynetwork docker network"
# docker network create mynetwork || true

# echo "Allow local root for X server"
# xhost +local:root
# grep -qxF 'xhost +local:root' ~/.profile || echo 'xhost +local:root' >> ~/.profile
# grep -qxF 'xhost +local:root' ~/.profile || echo 'xhost +local:root' >> ~/.xsessionrc


# -------------------------------------------------------------------
# setup my container service 
# echo "Preparing script for mycontainer"
# sudo sh -c "cat > /usr/local/bin/xhostchk.sh <<EOF
# #!/bin/bash
# export DISPLAY=:0
# # Wait until X server is available
# while ! xset q >/dev/null 2>&1; do
#     sleep 1
# done
# # Run xhost command
# /usr/bin/xhost +local:root
# EOF"
#     sudo chmod +x /usr/local/bin/xhostchk.sh
#     echo "Installing xhost-root service"
#     sudo sh -c "cat > /etc/systemd/system/xhost-root.service <<EOF
# [Unit]
# Description=Allow to connect X server
# After=display-manager.service
# Requires=display-manager.service

# [Service]
# Type=oneshot
# ExecStart=/usr/local/bin/xhostchk.sh
# User=$un

# [Install]
# WantedBy=graphical.target
# EOF"


# echo "Installing mycontainer service"
# sudo sh -c "cat > /etc/systemd/system/mycontainer.service <<EOF
# [Unit]
# Description=Start docker container for mycontainer
# After=docker.service 
# Requires=docker.service 

# [Service]
# Type=oneshot
# RemainAfterExit=true
# ExecStart=/usr/bin/docker container start mycontainer
# ExecStop=/usr/bin/docker container stop mycontainer
# User=$un

# [Install]
# WantedBy=multi-user.target
# EOF"
    
# sudo systemctl daemon-reload
# sudo systemctl enable xhost-root.service
# sudo systemctl start xhost-root.service
# sudo systemctl enable mycontainer.service
# sudo systemctl start mycontainer.service

