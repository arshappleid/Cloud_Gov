// AZ - 1 Subnet
resource "aws_subnet" "az1_private_subnet" {
  vpc_id            = aws_vpc.frontend_vpc
  cidr_block        = "10.2.1.0/24"
  availability_zone = "us-east-1"
  tags = {
    Name = "AZ-1_Subnet"
  }
}

// AZ-  2 Subnet
resource "aws_subnet" "az2_private_subnet" {
  vpc_id            = aws_vpc.frontend_vpc
  cidr_block        = "10.2.2.0/24"
  availability_zone = "us-east-2"
  tags = {
    Name = "AZ-2_Subnet"
  }
}