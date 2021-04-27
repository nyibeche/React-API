variable "region" {
  description = "AWS region"
  
}

variable "vpc_id" {
  description = "ID for AWS VPC"
  type        = string
}

variable "elb-sg" {
  description = "A list of security group IDs to assign to the launch configuration"
  type        = string
}

variable "asg_name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
}

variable "bucket_role" {
  description = "Role that has access to AWS secure s3 bucket"
  type        = string
}

variable "instance_type" {
  description = "AWS EC2 Instance type for Web Server"
}

variable "ami_id" {
  description = "AMI image ID to use for AWS EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Private key for SSH access to EC2 Instance"
  type        = string

}

variable "subnet_id" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
}

variable "loadbalancer_name" {
  description = "Name of the loadbalancer to be associated with the autoscaling group"
  type        = string
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  type        = string
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  type        = string
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  type        = string
}

variable "health_check_type" {
  description = "Controls how health checking is done. Values are - EC2 and ELB"
  type        = string
}

