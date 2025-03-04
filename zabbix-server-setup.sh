#!/bin/bash

#Uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

#update package 
sudo apt-get update 

#install dependencies 
sudo apt-get install ca-certificates curl 

#Create the directory for Docker keyrings (if it doesn't exist)
sudo mkdir -p /etc/apt/keyrings 

#Download Docker GPG key 
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc 

#Adjust file permissions 
sudo chmod o-rwx /etc/apt/keyrings/docker.asc 

echo "Docker GPG key downloaded and installed."

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#Install latest Docker version 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

echo "Docker runtime installed"


#Installing Git 
sudo apt install git-all

echo "Installed Git"

#Clone the Zabbix-repo 
git clone https://github.com/zabbix/zabbix-docker.git

echo "Clonned the Zabbix-server"

exit 0
