// AZ - 1 Subnet
resource "aws_subnet" "az1_private_subnet" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.frontend_vpc.cidr_block, 8, 1) // 10.2.1.0/24
  availability_zone = var.ALB_AZ1
  tags = {
    Name = "FrontEnd_VPC_AZ-1_Subnet"
  }
}

// AZ-  2 Subnet
resource "aws_subnet" "az2_private_subnet" {
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.frontend_vpc.cidr_block, 8, 2) // 10.2.2.0/24
  availability_zone = var.ALB_AZ2
  tags = {
    Name = "FrontEnd_VPC_AZ-2_Subnet"
  }
}