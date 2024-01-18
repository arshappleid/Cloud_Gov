output "CIDR_Block" {
  value       = aws_vpc.security_vpc.cidr_block
  description = "Security VPC CIDR"
}

output "transit_gateway_id"{
	value = aws_ec2_transit_gateway.Main_Transity_Gateway.id
	description = "Transit Gateway Id"
}