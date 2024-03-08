resource "aws_launch_configuration" "frontEndApp_Launch_Config" {
    image_id      = var.ASG_instance_AMI_Id
    instance_type = var.ASG_instance_type
    
    security_groups = [aws_security_group.ASG_sg.id]

    lifecycle {
        create_before_destroy = true
    }
}
