resource "aws_lb_target_group" "az1_target_group" {
  name     = "az1_target_group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.frontend_vpc.id
}