resource "aws_autoscaling_group" "asg" {
    desired_capacity     = var.ASG_desired_capacity
    max_size             = var.ASG_max_size
    min_size             = var.ASG_min_size
    launch_configuration = aws_launch_configuration.frontEndApp_Launch_Config.id
    //availability_zones = [var.availability_zone]
    vpc_zone_identifier = [var.ASG_SUBNET_ID]
    target_group_arns = [aws_lb_target_group.tg.arn]


    tag {
        key                 = "Name"
        value               = "my-instance"
        propagate_at_launch = true
    }
}
