resource "aws_subnet" "security_vpc_public_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.1.1.0/24"
}