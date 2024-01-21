## Route FrontEnd_VPC_CIDR -> Transit Gateway Attachment
resource "aws_route" "frontEnd_VPC_route_table" {
  route_table_id         = aws_vpc.security_vpc.main_route_table_id
  destination_cidr_block = var.FrontEnd_VPC_CIDR_block
  gateway_id             = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.transit_gateway_id
}

resource "aws_route" "interet_outbound_route"{
	route_table_id         = aws_vpc.security_vpc.main_route_table_id
	destination_cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.gw.id
}