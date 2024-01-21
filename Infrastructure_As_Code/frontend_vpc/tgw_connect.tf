
# Create TGW Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id = data.aws_ec2_transit_gateway.main_tgw.id
  vpc_id             = aws_vpc.frontend_vpc.id
  subnet_ids         = data.aws_subnets.frontEnd_vpc_subnets.ids
  tags = {
    Name = "FrontEnd_VPC_TGW_Attachment"
  }
}
# Create the Route Table
resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {
  transit_gateway_id = data.aws_ec2_transit_gateway.main_tgw.id
}

# Add the Route to the Route Table
resource "aws_ec2_transit_gateway_route" "example_to_vpc" {
  // To : Destination CIDR   go -> Transit Gateway Attachment
  destination_cidr_block         = var.Securtiy_VPC_CIDR # CIDR block for the other VPC
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
}

# Teach about all the routes available through FrontEnd VPC , to the Transity Gateway
resource "aws_ec2_transit_gateway_route_table_propagation" "propogate_routes" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
}