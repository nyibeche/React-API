provider "aws" {
  version                 = "2.53.0"
  region                  = var.region
#  shared_credentials_file = "/home/ec2-user/.config/aws/credentials"
}

# Our default security group to access  the instances over SSH and HTTP
resource "aws_security_group" "elb_sg" {
  name        = var.elb-sg
  vpc_id      = var.vpc_id
  
  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "aws_loadbalancer" {
  name                = var.loadbalancer_name

  listener {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTPS:443/"
    interval            = 15
  }

  security_groups       = [aws_security_group.elb_sg.id]
  subnets               = var.subnet_id

  cross_zone_load_balancing   = true
  internal                    = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
 

  tags = {
    Name = var.loadbalancer_name
  }
}

