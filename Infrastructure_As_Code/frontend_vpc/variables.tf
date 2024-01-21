variable "test" {
  default     = false
  type        = bool
  description = "Use this to initialize the test environment"
}
variable "ALB_AZ1" {
  type        = string
  default     = "us-east-1a"
  description = "1 of the 2 AZ in which the ALB will be deployed."
}

variable "ALB_AZ2" {
  type        = string
  default     = "us-east-1b"
  description = "1 of the 2 AZ in which the ALB will be deployed."
}

variable "Securtiy_VPC_CIDR" {
  default = "10.1.0.0/16"
}


data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

data "aws_ec2_transit_gateway" "main_tgw" {
  filter {
    name   = "tag:Name"
    values = ["Cloud_Gov_TG"]
  }
}

data "aws_subnets" "frontEnd_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.frontend_vpc.id]
  }
}