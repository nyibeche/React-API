variable "loadbalancer_name" {
description = "AWS elastic load balancer resource name"
}

variable "region" {
description = "AWS region"
}

variable "vpc_id" {
description = "ID for AWS VPC "
}



variable "subnet_id" {
description = "AWS VPC subnet ID"
}

variable "elb-sg" {
description = "AWS Web Server Security Group"
}

