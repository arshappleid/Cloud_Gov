resource "aws_ec2_transit_gateway" "example_tgw" {
  description = "Example Transit Gateway"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "example_tgw_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.example_tgw.id
  vpc_id             = aws_vpc.example_vpc.id
  subnet_ids         = [aws_subnet.example_subnet.id]
}

resource "aws_ec2_transit_gateway_route_table" "example_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.example_tgw.id
}