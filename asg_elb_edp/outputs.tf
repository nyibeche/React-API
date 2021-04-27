# Output domain name of the load balancer.
output "elb_dns_name" {
  value       = module.elb.elb_dns_name
  description = "The domain name of the load balancer"
}

# Output the loadbalancer security group.
output "security_group_id" {
  value = module.elb.security_group_id
  description = "Loadbalancer security group ID"
}

# Output iam instance profile name
output "iam_instance_profile" {
  value = module.asg.iam_instance_profile
}
