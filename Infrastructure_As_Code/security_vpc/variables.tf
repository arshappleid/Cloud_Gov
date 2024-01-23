variable "test" {
  type        = bool
  description = "Boolean , enable test environment ?"
}

variable "FrontEnd_VPC_CIDR_block" {
  type    = string
  default = "10.2.0.0/16"
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

data "aws_subnets" "security_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.security_vpc.id]
  }
}

data "aws_ec2_transit_gateway_attachment" "frontend_vpc_tgw_attachment" {
  filter {
    name   = "tag:Name"
    values = ["FrontEnd_VPC_TGW_Attachment"]
  }
}

data "aws_instance" "frontEnd_VPC_Bastion_host"{
  filter{
    name = "tag:Name"
    values = ["Test Bastion Host - FrontEnd VPC"]
  }
}

