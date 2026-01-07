#!/bin/bash

# 1. Install prerequisites
echo "Installing prerequisites..."
sudo apt-get update
sudo apt-get install wget apt-transport-https gnupg lsb-release -y

# 2. Add the public key for the Trivy repository
echo "Adding Trivy public key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

# 3. Add the repository to your sources list
echo "Adding Trivy repository to sources..."
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

# 4. Update and install
echo "Updating and installing Trivy..."
sudo apt-get update
sudo apt-get install trivy -y

# 5. Verify installation
echo "-----------------------------------"
trivy --version
echo "Trivy installed successfully!"
