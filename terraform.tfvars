#Global
region = "ap-south-1"

#VPC
vpc_name = "my-vpc"
vpc_cidr_block = "10.0.0.0/26"
public-subnet-1a-cidr = "10.0.0.0/28"
public-subnet-2b-cidr = "10.0.0.16/28"
private-subnet-1a-cidr = "10.0.0.32/28"
private-subnet-2b-cidr = "10.0.0.48/28"
ig_name = "my-ig"
natgateway_name = "my-nat-gateway"

#ALB
alb_name = "my-alb-wp"
alb_type = "application"
tg_name = "my-wp-tg"

#Bastion Host
bastion_host_name = "bastion_host"
bastion_ami = "ami-0a1b648e2cd533174"
bastion_instance = "t3a.micro"

#ASG
launch_temp_name = "my-wp-lt"

#Route53
domain = "londonbucks.com"