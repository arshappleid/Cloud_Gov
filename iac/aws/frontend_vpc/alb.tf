resource "aws_lb" "frontend_alb" {

  name               = "frontend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnet_ids.all_subnets.ids // assumes all subnets are private

  enable_deletion_protection = false
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = 80 // Port on which the AWS LB listens to redirect traffic
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = module.target_group_east1a.target_group_arn
  }
  // Add weighted rules , to redirect to different target group attachments.
}

// If you want to change the listener rule to Host based routing change here
// If in Future you want to add another 
