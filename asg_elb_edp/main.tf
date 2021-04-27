module "elb" {
  source = "../modules/elb"

  elb-sg            = var.loadbalancer_security_group_name 
  loadbalancer_name = var.loadbalancer_name
  region            = var.region
  vpc_id            = var.vpc_id
  subnet_id         = [var.subnet_id]

}

module "asg" {
  source = "../modules/asg"

  asg_name                            = var.autoscalegroup_name 
  region                              = var.region
  vpc_id                              = var.vpc_id
  elb-sg                              = module.elb.security_group_id
  iam_instance_profile                = var.webserver_iam_instance_profile_name 
  bucket_role                         = var.bucket_role
  instance_type                       = var.instance_type
  ami_id                              = var.ami_id
  key_name                            = var.key_name
  subnet_id                           = [var.subnet_id]
  user_data                           = var.user_data
  loadbalancer_name                   = var.loadbalancer_name
  max_size                            = var.max_instances
  min_size                            = var.min_instances
  desired_capacity                    = var.desired_instances
  health_check_type                   = var.health_check_type
  userdata_s3bucket                   = var.userdata_s3bucket
}

