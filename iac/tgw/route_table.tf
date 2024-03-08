resource "aws_ec2_transit_gateway_route" "destination_internet" {
  destination_cidr_block         = "0.0.0.0/0"                    // destination
  transit_gateway_attachment_id  = data.aws_ec2_transit_gateway_vpc_attachment.security_tgw_attach.id  // go through
  transit_gateway_route_table_id = aws_ec2_transit_gateway.Main_Transity_Gateway.association_default_route_table_id
}