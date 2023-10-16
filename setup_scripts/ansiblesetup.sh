#!/bin/bash

#Install ansible
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y
