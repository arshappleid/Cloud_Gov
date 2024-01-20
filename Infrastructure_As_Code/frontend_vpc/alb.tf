resource "aws_lb" "frontend_alb" {
  name               = "frontend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = []

  enable_deletion_protection = false
}


// You can create target group , but they also need to be attached.
resource "aws_lb_target_group_attachment" "tg1_attachment" {
    target_group_arn = module.target_group_east1a.target_group_arn
    target_id        = module.target_group_east1a.auto_scaling_group_id
    port             = 80 // port on which the targets are listening
}

// You can create target group , but they also need to be attached.
resource "aws_lb_target_group_attachment" "tg2_attachment" {
    target_group_arn = module.target_group_east1b.target_group_arn
    target_id        = module.target_group_east1b.auto_scaling_group_id
    port             = 80 // port on which the targets are listening
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.frontend_alb.arn
    port              = 80			// Port on which the AWS LB listens to redirect traffic
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = module.target_group_east1a.target_group_arn
    }
	// Add weighted rules , to redirect to different target group attachments.
}

// If you want to change the listener rule to Host based routing change here
// If in Future you want to add another 