module "transit_gateway" {
  source = "../security_vpc"
}

module "target_group_east1a"{
  source = "./alb_target_group"
  // Input variables
  availability_zone = "us-east-1a"
  ASG_instance_AMI_Id = "ami-04c0f9ef2f505b609"
  ASG_instance_type = "t2.micro"
  ASG_desired_capacity = 2
  ASG_max_size = 5
  ASG_min_size = 1
  ALB_Id = aws_lb.frontend_alb.id
}

module "target_group_east1b"{
  source = "./alb_target_group"
  // Input variables
  availability_zone = "us-east-1b"
  ALB_Id = aws_lb.frontend_alb.id
}

