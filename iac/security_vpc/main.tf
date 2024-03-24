module "firewall_ec2" {
  source        = "./firewall_ec2"
  ec2_vpc_Id    = aws_vpc.security_vpc.id
  ec2_subnet_Id = aws_subnet.security_vpc_public_subnet.id
}
