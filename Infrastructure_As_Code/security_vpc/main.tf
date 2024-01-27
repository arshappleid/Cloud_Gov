module "firewall_ec2" {
  source        = "./firewall_ec2"
  ec2_vpc_Id    = aws_vpc.security_vpc.id
  ec2_subnet1_Id = aws_subnet.security_vpc_private_subnet1.id
  ec2_subnet2_Id = aws_subnet.security_vpc_private_subnet2.id
}