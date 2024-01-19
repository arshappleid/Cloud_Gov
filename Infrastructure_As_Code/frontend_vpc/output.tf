output "VPC_CIDR_BLOCK" {
  value = aws_vpc.frontend_vpc.cidr_block
}
output "VPC_ID" {
  value = aws_vpc.frontend_vpc.id
}

output "ALB_Id" {
  value = aws_lb.frontend_alb.id
}
output "ALB_SecurityGroup_Id"{
  value = aws_security_group.alb_sg.id
}