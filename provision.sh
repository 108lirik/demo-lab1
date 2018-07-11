#!/bin/bash

# Jenkins & Java

echo "Installing Jenkins and Java"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install jenkins > /dev/null 2>&1
sudo apt-get install openjdk-8-jdk > /dev/null 2>&1
sudo export JAVA_HOME="/usr/lib/jvm/open-jdk"


# Docker

echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce > /dev/null 2>&1
sudo systemctl enable docker
sudo usermod -aG docker ${USER}
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu

# nginx

echo "Installing nginx"
sudo apt-get -y install nginx > /dev/null 2>&1
sudo service nginx start


# Configuring nginx

echo "Configuring nginx"
cd /etc/nginx/sites-available
sudo rm default ../sites-enabled/default
sudo cp /vagrant/jenkins /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo service nginx restart
sudo service jenkins restart

# Saving Jenkins Initial Pass

sudo cp /var/lib/jenkins/secrets/initialAdminPassword /vagrant/JenkinsPass.txt

echo "Jenkins install complete, Initial Password is in a local project directory"
echo ""
echo ""
echo ""



# Install Maven

echo "Install Maven"
sudo apt-get -y install maven > /dev/null 2>&1


# Install Git

echo "Install Git"
sudo apt-get install -y git-core > /dev/null 2>&1


# Install Ansible

sudo apt-add-repository -y ppa:ansible/ansible > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y ansible > /dev/null 2>&1
sudo apt-get install python-software-properties > /dev/null 2>&1
sudo cp /vagrant/ansible/hosts /etc/ansible/
echo "DONE!"
