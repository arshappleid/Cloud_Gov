resource "aws_route" "interet_outbound_route" {
  route_table_id         = aws_vpc.security_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.security_vpc_nat_gateway.id
}
