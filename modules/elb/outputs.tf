output "security_group_id" {
    value = aws_security_group.elb_sg.id
}

output "elb_dns_name" {
  value       = aws_elb.aws_loadbalancer.dns_name
  description = "The domain name of the load balancer"
}
