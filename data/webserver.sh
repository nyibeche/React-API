#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install ansible2 -y
mkdir /home/ec2-user/vadmin/
cd /home/ec2-user/vadmin/
sudo aws s3 cp s3://S3BUCKETLOCATION/apache_webserver_role.zip .
sudo unzip apache_webserver_role.zip
sudo rm -rf apache_webserver_role.zip
sudo ansible-playbook Apache.yml
