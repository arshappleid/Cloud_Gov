resource "aws_security_group" "ec2_sg" {
    name        = "ec2-sg"
    description = "Security group for EC2 instances in ASG"
    vpc_id      = module.alb.VPC_ID

	// Only allow traffic from the ALB
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [module.alb.ALB_SecurityGroup_Id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
