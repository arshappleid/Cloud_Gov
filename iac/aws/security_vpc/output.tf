output "AMI_Id_Firewall_Instance" {
  value = module.firewall_ec2.ami_Id
}
output "recieving_endpoint" {
  value       = aws_lb.network_lb.dns_name
  description = "DNS name for the recieving endpoint, to traverse traffic through security VPC"
}
