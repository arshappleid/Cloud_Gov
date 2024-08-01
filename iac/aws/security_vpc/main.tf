resource "aws_lb" "network_lb" {
  name                       = "${var.tags.project_name}-NetworkLB-${var.tags.env}"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = var.public_subnet_ids
  enable_deletion_protection = false
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.network_lb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example_tg.arn
  }
}

resource "aws_lb_target_group" "front_end_vpc_target" {
  name     = "${var.tags.project_name}-NetworkLB-${var.tags.env}-Transit-Gateway-Target"
  port     = 80
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_alb_target_group_attachment" "example" {
  target_group_arn = aws_alb_target_group.front_end_vpc_target.arn
  target_id        = var.frontend_alb_id
  port             = 80
}
