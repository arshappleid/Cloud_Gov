variable "env" {
  default     = "dev"
  description = "Environment Type : dev , test , stag"
}
variable "vpc_id" {
  description = "VPC ID , to Deploy all the resources in"
}
variable "main_route_table_id" {
  description = "main route table id , to add internet outbound route"
}
variable "public_subnet_ids" {
  description = "Public Subnet Ids , to deploy the Security EC2 instances"
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




