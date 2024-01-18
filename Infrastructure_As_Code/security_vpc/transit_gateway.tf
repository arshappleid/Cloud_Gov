resource "aws_ec2_transit_gateway" "Main_Transity_Gateway" {
  description = "Main Transit Gateway"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "example_tgw_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.Main_Transity_Gateway.id
  vpc_id             = aws_vpc.security_vpc.id
  subnet_ids         = [aws_subnet.security_vpc_public_subnet.id]
}

resource "aws_ec2_transit_gateway_route_table" "example_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.example_tgw.id
}