output "VPC_CIDR_Block" {
  value       = aws_vpc.security_vpc.cidr_block
  description = "Security VPC CIDR"
}

output "Public_Subnet_CIDR_Block"{
  value = aws_subnet.security_vpc_public_subnet.cidr_block
  description = "Firewall Ec2 Instance Subnet block"
}
output "AMI_Id_Firewall_Instance"{
  value = module.firewall_ec2.ami_Id
}
output "transit_gateway_id" {
  value       = aws_ec2_transit_gateway.Main_Transity_Gateway.id
  description = "Transit Gateway Id"
}
