# output aws iam instnace profile name
output "iam_instance_profile" {
  value = aws_iam_instance_profile.ec2.name
}

