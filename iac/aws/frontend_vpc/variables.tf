variable "env" {
  default     = "dev"
  description = "Environment Type : dev , test , stag"
}
output "main_route_table_id" {
  value = aws_vpc.frontend_vpc.main_route_table_id
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
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

variable "tgw_id" {
  description = "TGW ID to connect this VPC to"
}



