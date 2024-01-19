output "VPC_CIDR_BLOCK" {
  value = aws_vpc.frontend_vpc.cidr_block
}