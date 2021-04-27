#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
mkdir /home/ec2-user/vadmin/
cd /home/ec2-user/vadmin/
sudo aws s3 cp s3://S3BUCKETLOCATION/ansible_edp.zip .
sudo unzip ansible_edp.zip
sudo rm -rf ansible_edp.zip
sudo ansible-playbook jenkins.yml
