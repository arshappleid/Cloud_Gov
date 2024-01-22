resource "aws_internet_gateway" "gw" {
  vpc_id     = aws_vpc.security_vpc.id
  depends_on = [aws_vpc.security_vpc]
  tags = {
    Name = "Internet Gateay , Security VPC"
  }
}