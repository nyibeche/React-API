variable "region" {
description = "AWS region"
}

variable "vpc_id" {
description = "ID for AWS VPC "
}

variable "loadbalancer_security_group_name" {
description = "AWS loadbalancer Security Group"
default = "loadbalancer-sg-default"
}

variable "webserver_security_group_name" {
description = "name of security group for webserver"
default = "webserver-sg-default"
}

variable "webserver_iam_instance_profile_name" {
description = "AWS Web Server Instance Profile to attach IAM role to EC2 instance"
default = "webserver-instance-profile-default"
}

variable "bucket_role" {
description = "Role that has access to AWS secure s3 bucket"
}

variable "instance_type" {
description = "AWS EC2 Instance type for Web Server. Changing the default may incur extra costs."
default = "t2.micro"
}

variable "ami_id" {
description = "AMI ID to use on AWS EC2 instance. Changing the default will almost always require a new bootstrap script."
default = "ami-0b69ea66ff7391e80"
}

variable "key_name" {
description = "Private key for access to EC2 Instance"
}

variable "subnet_id" {
description = "AWS VPC subnet ID"
}

variable "user_data" {
description = "Location of local bootstrap script to run after terraform"
default = "../data/webserver.sh"
}

variable "vm_name" {
description = "AWS EC2 instance tags for Web Server name"
default = "Webserver-VM"
}

variable "loadbalancer_name" {
description = "Name for AWS elastic loadbalancer"
default = "Webserver-Loadbalancer"
}

variable "autoscalegroup_name" {
description = "name given to AWS auto scaling group"
default = "webserver-autoscalegroup-default"
}

variable "max_instances" {
description = "maximum number of instances to be created within the autoscaling group"
default = 2
}

variable "min_instances" {
description = "minimum number of instances to be maintained within the autoscaling group"
default = 1
}

variable "desired_instances" {
description = "base number of instances the autoscaling group is preferred to have on average"
default = 1
}

variable "health_check_type" {
description = "method to use for health check of autoscaling group"
default = "ELB"
}

variable "userdata_s3bucket" {
description = "bucket and location of user data files"
}
