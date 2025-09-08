#!/bin/bash
# Ansible and Kops,Aws-cli Installation Script for StackOps
# This script installs Ansible and Kops on an Ubuntu system.
# Update the package list
sudo apt-get update
# Installing Dependencies
sudo apt-get install -y software-properties-common
# Add Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible
# Install Ansible
sudo apt-get install -y ansible
# Install Kops
# Download the latest Kops binary
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
# Make the binary executable 
chmod +x kops
# Move it to /usr/local/bin
sudo mv kops /usr/local/bin/kops

# Install Kubectl
# Download the latest Kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install Kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install -y unzip
unzip awscliv2.zip
sudo ./aws/install

# Create AWS directory and configure credentials
mkdir -p ~/.aws
cp /tmp/credentials ~/.aws/credentials 2>/dev/null || echo "Warning: credentials file not found"
chmod 600 ~/.aws/credentials 2>/dev/null
