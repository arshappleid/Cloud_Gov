resource "aws_subnet" "security_vpc_public_subnet" {
  vpc_id     = aws_vpc.security_vpc.id
  cidr_block = "10.2.1.0/24"
}