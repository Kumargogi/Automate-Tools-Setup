#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt update -y

# 1. Install Java (Jenkins requires Java to run)
echo "Installing OpenJDK 17..."
sudo apt install fontconfig openjdk-17-jre -y

# 2. Add Jenkins Repository Key
echo "Adding Jenkins repository key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# 3. Add Jenkins Debian repository
echo "Adding Jenkins repository to sources..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# 4. Update package list again to include Jenkins repo
sudo apt update -y

# 5. Install Jenkins
echo "Installing Jenkins..."
sudo apt install jenkins -y

# 6. Start and Enable Jenkins
echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# 7. Show status and initial password
echo "------------------------------------------------"
echo "Installation Complete!"
echo "Jenkins is running on port 8080."
echo "Your Initial Admin Password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "------------------------------------------------"
