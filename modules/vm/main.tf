provider "aws" {
  version                 = "2.53.0"
  region                  = var.region
#  shared_credentials_file = "/home/ec2-user/.config/aws/credentials"
}
# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "webserver_sg" {
  name        = var.instance_security_group_name
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

  # sonarqube reverse proxy access from anywhere
  ingress {
    from_port   = 9000
    to_port     = 9000
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
resource "aws_iam_instance_profile" "webserver_instance_profile" {
  name = var.iam_instance_profile_name
  role = var.bucket_role
}

resource "aws_instance" "ec2" {
  instance_type          = var.instance_type
  count                  = var.instance_count
  ami                    = var.ami_id
  iam_instance_profile   = aws_iam_instance_profile.webserver_instance_profile.name
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  subnet_id              = var.subnet_id
  user_data              = replace(file(var.user_data), "S3BUCKETLOCATION", var.userdata_s3bucket)
  tags = {
    Name = var.vm_name
  }
}

