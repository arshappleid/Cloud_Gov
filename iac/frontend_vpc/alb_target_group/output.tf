output "target_group_arn"{
	value = aws_lb_target_group.tg.arn
}

output "auto_scaling_group_id"{
	value = aws_autoscaling_group.asg.id
}