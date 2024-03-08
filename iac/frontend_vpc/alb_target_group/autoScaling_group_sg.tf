resource "aws_security_group" "ASG_sg" {
    description = "Security group for EC2 instances in ASG"
    vpc_id      = var.ALB_VPC_ID

	// Only allow traffic from the ALB
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [var.ALB_Security_Group_id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
