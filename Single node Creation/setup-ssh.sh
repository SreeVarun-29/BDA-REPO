#!/bin/bash
# Setup passwordless SSH for Hadoop

sudo apt install openssh-server -y
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

echo "SSH setup complete. Test with: ssh localhost"
