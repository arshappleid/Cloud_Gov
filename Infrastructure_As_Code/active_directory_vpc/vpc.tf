resource "aws_vpc" "active_directory_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Active_Directory_vpc"
  }
}

resource "aws_route_table" "ad_vpc_route_table" {
  vpc_id = aws_vpc.active_directory_vpc.id
}