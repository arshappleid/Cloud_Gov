resource "aws_ec2_transit_gateway_route" "route" {
  for_each = { for idx, dst in var.routes : idx => dst }


  destination_cidr_block         = each.value.cidr_block
  transit_gateway_attachment_id  = each.value.destination_id
  transit_gateway_route_table_id = var.tgw_id
}
