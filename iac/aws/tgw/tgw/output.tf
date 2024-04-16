output "id" {
  value       = aws_ec2_transit_gateway.Main_Transity_Gateway.id
  description = "Transit Gateway ID"
}

output "route_table_id" {
  value       = aws_ec2_transit_gateway.Main_Transity_Gateway.association_default_route_table_id
  description = "TGW Default Route Table ID"
}
