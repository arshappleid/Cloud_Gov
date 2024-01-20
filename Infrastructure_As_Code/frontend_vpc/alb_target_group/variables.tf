// Document this more
variable "target_group_port_number" {
	type = number
  default = 80
  description = "At which port on the ALB route this traffic , to target destination"
}

variable "ASG_instance_type" {
	type = string
	default = "t2.micro"
}
variable "availability_zone"{
    type = string
    default = "us-east-1a"
}
variable "ASG_instance_AMI_Id"{
	type = string
	default = "ami-04c0f9ef2f505b609" // default amazon ami id
}
variable "ASG_desired_capacity" {
    description = "The number of Amazon EC2 instances that should be running in the group."
    type        = number
    default     = 2
}

variable "ASG_max_size" {
    description = "The maximum size of the Auto Scaling Group."
    type        = number
    default     = 5
}

variable "ASG_min_size" {
    description = "The minimum size of the Auto Scaling Group."
    type        = number
    default     = 1
}

variable "ALB_Id"{
    description = "Id of the ALB , the target group is supposed to be attached to."
}
