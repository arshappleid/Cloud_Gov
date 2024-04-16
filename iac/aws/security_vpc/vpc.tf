resource "aws_vpc" "security_vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Security_vpc"
  }
}

resource "aws_route_table" "security_vpc_route_table" {
  vpc_id = aws_vpc.security_vpc.id
}