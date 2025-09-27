#!/bin/bash
set -euxo pipefail

# Add Docker's official GPG key
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add azureuser to docker group
sudo usermod -aG docker azureuser

# Update Docker to latest version
DEBIAN_FRONTEND=noninteractive sudo apt-get upgrade -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Nginx
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
