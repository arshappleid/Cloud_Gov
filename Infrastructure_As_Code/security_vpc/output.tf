output "instance_ids" {
  value       = aws_vpc.security_vpc.cidr_block
  description = "Security VPC CIDR"
}