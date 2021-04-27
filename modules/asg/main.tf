provider "aws" {
  version                 = "2.53.0"
  region                  = var.region
#  shared_credentials_file = "/home/ec2-user/.config/aws/credentials"
}


resource "aws_iam_instance_profile" "ec2" {
  name = var.iam_instance_profile
  role = var.bucket_role
}

## Creating Launch Configuration
resource "aws_launch_configuration" "WeblaunchConfig" {
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  security_groups        = [var.elb-sg]
  iam_instance_profile   = aws_iam_instance_profile.ec2.name
  user_data              = file(var.user_data)
  lifecycle {
    create_before_destroy = true
  }
}

## Creating AutoScaling Group
resource "aws_autoscaling_group" "Webautoscale" {
  name                 = var.asg_name
  launch_configuration = aws_launch_configuration.WeblaunchConfig.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  load_balancers       = [var.loadbalancer_name]
  health_check_type    = var.health_check_type
  vpc_zone_identifier  = var.subnet_id
  tag {
    key = "Name"
    value = "terraform-asg-Webautoscale"
    propagate_at_launch = true
  }
}

