module "firewall_ec2" {
  source          = "./firewall_ec2"
  ec2_vpc_Id      = var.vpc_id
  ec2_subnets_Ids = var.public_subnet_ids
}
