resource "aws_subnet" "security_vpc_public_subnet" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Security_VPC_Public_Subnet1"
  }
}

resource "aws_subnet" "security_vpc_private_subnet1" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Security_VPC_Private_Subnet1"
  }
}

resource "aws_subnet" "security_vpc_private_subnet2" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Security_VPC_Private_Subnet2"
  }
}