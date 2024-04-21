data "aws_subnet_ids" "all_subnets" {
  vpc_id = var.vpc_id
}

module "target_group_east1a" {
  source = "./alb_target_group"
  // Input variables
  availability_zone     = var.ALB_AZ1
  ASG_instance_AMI_Id   = "ami-04c0f9ef2f505b609"
  ASG_instance_type     = "t2.micro"
  ASG_desired_capacity  = 2
  ASG_max_size          = 5
  ASG_min_size          = 1
  ALB_Id                = aws_lb.frontend_alb.id
  ALB_Security_Group_id = aws_security_group.alb_sg.id
  ALB_VPC_ID            = var.vpc_id
  ASG_SUBNET_ID         = data.aws_subnet_ids.all_subnets.ids[0]
}

module "target_group_east1b" {
  source = "./alb_target_group"
  // Input variables
  availability_zone     = var.ALB_AZ2
  ALB_Id                = aws_lb.frontend_alb.id
  ALB_Security_Group_id = aws_security_group.alb_sg.id
  ALB_VPC_ID            = var.vpc_id
  ASG_SUBNET_ID         = data.aws_subnet_ids.all_subnets.ids[1]
}

