variable "env" {
  default     = "dev"
  description = "Environment Type : dev , test , stag"
}

variable "tgw_id" {
  description = "TGW ID to connect this VPC to"
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}
variable "FrontEnd_VPC_CIDR_block" {
  type = string
}


data "aws_ec2_transit_gateway" "main_tgw" {
  filter {
    name   = "tag:Name"
    values = ["Cloud_Gov_TG"]
  }
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




