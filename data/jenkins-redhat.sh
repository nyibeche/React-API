#!/bin/bash
sudo yum update -y
sudo yum install python3 -y
sudo alternatives --set python /usr/bin/python3
sudo yum -y install python3-pip
sudo pip3 install ansible
sudo yum -y install zip
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
mkdir /home/ec2-user/vadmin/
cd /home/ec2-user/vadmin/
sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
sudo /usr/local/bin/aws s3 cp s3://va-secure/webserver/ansible_edp.zip .
sudo unzip ansible_edp.zip
sudo rm -rf ansible_edp.zip
sudo /usr/local/bin/ansible-playbook jenkins.yml
