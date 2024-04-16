output "VPC_CIDR_BLOCK" {
  value = aws_vpc.frontend_vpc.cidr_block
}
output "vpc_id" {
  value = aws_vpc.frontend_vpc.id
}
data "aws_subnet_ids" "selected" {
  vpc_id = var.vpc_id
}
output "subnet_ids" {
  value = data.aws_subnet_ids.selected.ids
}

output "ALB_Id" {
  value = aws_lb.frontend_alb.id
}
output "ALB_SecurityGroup_Id" {
  value = aws_security_group.alb_sg.id
}
