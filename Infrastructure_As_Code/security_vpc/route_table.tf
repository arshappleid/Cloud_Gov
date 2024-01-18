resource "aws_route_table" "security_vpc_route_table" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"  // Traffic to the internet
    gateway_id = aws_internet_gateway.gw.id // Send to the internet gateway
  }
}

resource "aws_route_table_association" "route__" {
  subnet_id      = aws_subnet.example_subnet.id
  route_table_id = aws_route_table.example_rt.id
}