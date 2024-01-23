resource "aws_ec2_transit_gateway_route" "route_to_internet" {
  destination_cidr_block         = "0.0.0.0/0"  # Replace with your desired CIDR block
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.security_tgw_attach.id

	// Fix this.
  transit_gateway_route_table_id = aws_nat_gateway
}
