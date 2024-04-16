resource "aws_subnet" "security_vpc_public_subnet" {
  vpc_id            = aws_vpc.security_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Security_VPC_Main_Subnet"
  }
}