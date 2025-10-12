#!/bin/bash

# Update system packages
sudo yum update -y

# Install wget if not already installed
sudo yum install wget -y

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins GPG key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Java 17 (Amazon Corretto)
sudo yum install java-17-amazon-corretto -y

# Install Jenkins
sudo yum install jenkins -y

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Docker
sudo yum install docker -y

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Allow Jenkins to access Docker socket
sudo usermod -aG docker jenkins

# Adjust permissions for Docker socket
sudo chmod 666 /var/run/docker.sock

# Check the status of Jenkins and Docker services
sudo systemctl status jenkins
sudo systemctl status docker
