resource "aws_eip" "nat" {
}

resource "aws_nat_gateway" "security_vpc_nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.security_vpc_public_subnet.id
  tags = {
    Name = "Internet Access NatGateway"
  }
}
