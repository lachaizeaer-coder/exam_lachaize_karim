#!/bin/bash
# Installs Ansible on Ubuntu and the collections required by the roles
set -e #stop script on error
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible
ansible-galaxy collection install -r "$(dirname "$0")/requirements.yml"