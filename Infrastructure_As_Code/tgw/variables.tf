variable "env" {
  description = "prod / test / dev , environments "
  default     = "test"
}

data "aws_ec2_transit_gateway_vpc_attachment" "security_tgw_attach" {
  filter {
    name   = "name"
    values = ["Security_VPC_TGW_Attachment"]  # Replace with your attachment name
  }
}