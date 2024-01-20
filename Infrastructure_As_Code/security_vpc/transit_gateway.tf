resource "aws_ec2_transit_gateway" "Main_Transity_Gateway" {
  description = "Main Transit Gateway"
  tags = {
    Name = "Security_VPC_TGW"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.Main_Transity_Gateway.id
  vpc_id             = aws_vpc.security_vpc.id
  subnet_ids         = [aws_subnet.security_vpc_public_subnet.id]
}

resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.Main_Transity_Gateway.id
}

