
# For each VPC Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  for_each = { for att in var.attachments : att.vpc_id => att }

  vpc_id             = each.value.vpc_id
  transit_gateway_id = var.tgw_id
  subnet_ids         = each.value.subnet_ids

  tags = {
    Name = "${each.value.vpc_name}-TGW-Attachment"
  }
}

# Create Individual Route Table for each attachment
resource "aws_ec2_transit_gateway_route_table" "this" {
  for_each = aws_ec2_transit_gateway_vpc_attachment.this

  transit_gateway_id = var.tgw_id
  tags = {
    Name = "${each.value.tags["Name"]}-Route_Table"
  }
}

# Create routes for each attachment
resource "aws_ec2_transit_gateway_route" "this" {
  for_each = aws_ec2_transit_gateway_vpc_attachment.this

  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this[each.key].id
  destination_cidr_block         = each.value.destination_cidr
  transit_gateway_attachment_id  = each.value.id
}

# Create Route for each VPC
resource "aws_route" "FrontEnd_VPC_route_table" {
  for_each = aws_ec2_transit_gateway_vpc_attachment.this

  route_table_id         = each.value.vpc_main_route_table_id
  destination_cidr_block = each.value.destination_cidr
  gateway_id             = each.value.id
}


# Propagate routes for each attachment to the corresponding route table
resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  for_each = aws_ec2_transit_gateway_vpc_attachment.this

  transit_gateway_attachment_id  = each.value.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this[each.key].id
}
