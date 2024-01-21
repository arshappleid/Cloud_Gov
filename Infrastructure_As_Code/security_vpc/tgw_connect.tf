# Create TGW Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.Main_Transity_Gateway.id
  vpc_id             = aws_vpc.security_vpc.id
  subnet_ids         = [aws_subnet.security_vpc_public_subnet.id]
}
# Create the Route Table
resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.Main_Transity_Gateway.id
}

# Connect the Route Table to the vpc Attachment
resource "aws_ec2_transit_gateway_route_table_association" "tgw_route_table_associate" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
}


# Add the Route to the Route Table
resource "aws_ec2_transit_gateway_route" "example_to_vpc" {
  // To : Destination CIDR   go -> Transit Gateway Attachment
  destination_cidr_block         = var.FrontEnd_VPC_CIDR_block # CIDR block for the other VPC
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_route_table.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
}


