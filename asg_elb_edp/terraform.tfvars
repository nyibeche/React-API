### Required AWS environment variables
region =
vpc_id =
subnet_id =
bucket_role =
key_name =

### required s3 location of ansible scripts
### eg: if located in bucket "MyBucket" in folder "AnsibleZips" then value to enter is: "MyBucket/AnsibleZips"
userdata_s3bucket =

### Configurations with pre-set defaults
#ami_id = "ami-0b69ea66ff7391e80"
#instance_type = "t2.micro"
#user_data = "../data/webserver.sh"
#vm_name = "Webserver-VM"
#oadbalancer_name = "Webserver-Loadbalancer"
#webserver_security_group_name = "webserver-sg-default"
#loadbalancer_security_group_name = "loadbalancer-sg-default"
#webserver_iam_instance_profile_name = "webserver-instance-profile-default"
#autoscalegroup_name = "webserver-autoscalegroup-name"
#max_instances = 2
#min_instances = 1
#desired_instances = 1
#health_check_type = "ELB

