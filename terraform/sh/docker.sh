#!/bin/bash

# Install Docker
yum update -y
yum install docker -y

# Start Docker and configure it to start on boot
systemctl start docker
systemctl enable docker

# Add the current user to the docker group to avoid using sudo every time
usermod -aG docker $USER
