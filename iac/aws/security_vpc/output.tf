output "VPC_CIDR_Block" {
  value       = aws_vpc.security_vpc.cidr_block
  description = "Security VPC CIDR"
}

output "vpc_id" {
  value = aws_vpc.security_vpc.id
}

data "aws_subnet_ids" "selected" {
  filter {
    name  = "vpc-id"
    value = [var.vpc_id]
  }
}
output "subnet_ids" {
  value = data.aws_subnet_ids.selected.ids
}

output "main_route_table_id" {
  value = aws_vpc.security_vpc.main_route_table_id
}

output "Public_Subnet_CIDR_Block" {
  value       = aws_subnet.security_vpc_public_subnet.cidr_block
  description = "Firewall Ec2 Instance Subnet block"
}
output "AMI_Id_Firewall_Instance" {
  value = module.firewall_ec2.ami_Id
}

output "Elastic_IP" {
  value       = aws_eip.nat.address
  description = "Elastic IP address , attached to NAT Gateway"
}


