#!/bin/bash

# Update the apt package index:
sudo apt-get update

## Install Ansible requirements
sudo apt-get install -y python-minimal python-pip vim awscli
sudo pip install docker
