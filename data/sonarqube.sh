#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
mkdir /home/ec2-user/vadmin/
cd /home/ec2-user/vadmin/
sudo amazon-linux-extras install postgresql10 vim epel
sudo aws s3 cp s3://S3BUCKETLOCATION/sonar_ansible_edp.zip .
sudo unzip sonar_ansible_edp.zip
sudo rm -rf sonar_ansible_edp.zip
sudo ansible-playbook sonarqube.yml
sudo reboot
