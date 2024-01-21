resource "aws_ec2_transit_gateway" "Main_Transity_Gateway" {
  description = "TGW for Cloud Gov Organization"
  dns_support = enable
  default_route_table_association = enable
  default_route_table_propagation = enable
  tags = {
    Name = "Cloud_Gov_TG"
  }
}