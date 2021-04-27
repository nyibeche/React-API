variable "region" {
description = "AWS region"
}

variable "vpc_id" {
description = "ID for AWS VPC "
}

variable "instance_security_group_name" {
description = "Instance scurity group"
}

variable "iam_instance_profile_name" {
description = "AWS ec2 Instance Profile to attach IAM role to EC2 instance"
}

variable "bucket_role" {
description = "Role that has access to AWS secure s3 bucket"
}

variable "instance_type" {
description = "AWS EC2 Instance type for Web Server"
}

variable "ami_id" {
description = "AMI ID to use on AWS EC2 instance"
}

variable "instance_count" {
description = "number of ec2 to create"
}

variable "key_name" {
description = "Private key for access to EC2 Instance"
}

variable "subnet_id" {
description = "AWS VPC subnet ID"
}

variable "user_data" {
description = "Bootstrap script to run after terraform"
}

variable "vm_name" {
description = "AWS EC2 instance tags for Web Server name"
}

variable "userdata_s3bucket" {
description = "bucket name and location of userdata"
}
