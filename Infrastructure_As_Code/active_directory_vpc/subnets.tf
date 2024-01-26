resource "aws_subnet" "ad_subnet_1" {
  vpc_id            = aws_vpc.active_directory_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Active Directory Private Subnet 1"
  }
}

resource "aws_subnet" "ad_subnet_2" {
  vpc_id            = aws_vpc.active_directory_vpc.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Active Directory Private Subnet 2"
  }
}