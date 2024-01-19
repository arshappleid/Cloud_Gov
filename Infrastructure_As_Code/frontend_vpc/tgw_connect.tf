resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id = module.transit_gateway.transit_gateway_id
  vpc_id             = aws_vpc.frontend_vpc.id
  subnet_ids         = [aws_subnet.security_vpc_public_subnet.id]
}
