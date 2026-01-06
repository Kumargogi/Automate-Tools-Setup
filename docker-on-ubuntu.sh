#!/bin/bash

# =================================================================
# Script Name: install_docker.sh
# Description: Automated Docker Engine Installation for Ubuntu
# =================================================================

# Exit immediately if a command exits with a non-zero status
set -e

echo "--- 1. Updating package index and installing dependencies ---"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

echo "--- 2. Setting up Docker's official GPG key ---"
# Creating directory for keyrings if it doesn't exist
sudo install -m 0755 -d /etc/apt/keyrings
# Downloading the key and saving it
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Ensuring the key is readable
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "--- 3. Adding Docker repository to Apt sources ---"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "--- 4. Installing Docker Engine, CLI, and Compose ---"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "--- 5. Adding current user to the docker group ---"
# This allows you to run docker commands without 'sudo'
sudo usermod -aG docker $USER

echo "--- 6. Verifying installation with hello-world ---"
# Note: You might need to restart your terminal/re-log for the group change to apply
# We use sudo here for the first test to ensure it works regardless
sudo docker run hello-world

echo "=========================================================="
echo " Docker installation complete!"
echo " IMPORTANT: Please log out and log back in to run Docker without sudo."
echo "=========================================================="
