output "VPC_CIDR_Block" {
  value       = aws_vpc.security_vpc.cidr_block
  description = "Security VPC CIDR"
}

output "AMI_Id_Firewall_Instance" {
  value = module.firewall_ec2.ami_Id
}
// Not needed
output "transit_gateway_id" {
  value       = data.aws_ec2_transit_gateway.main_tgw.id
  description = "Transit Gateway Id"
}
