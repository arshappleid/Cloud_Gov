resource "aws_route_table" "security_vpc_route_table" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"  // Traffic to the internet
    gateway_id = aws_internet_gateway.gw.id // Send to the internet gateway
  }
  // Add other routes here
}

resource "aws_route_table_association" "aws_route_table_association" {
  subnet_id      = aws_subnet.security_vpc_public_subnet.id
  route_table_id = aws_route_table.security_vpc_route_table.id
}