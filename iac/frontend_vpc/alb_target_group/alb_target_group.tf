resource "aws_lb_target_group" "tg" {
    port     = var.target_group_port_number
    protocol = "HTTP"
    vpc_id   = var.ALB_VPC_ID
}

