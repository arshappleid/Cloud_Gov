

module "security_vpc_infra" {
  source = "./security_vpc"

  env                 = var.env
  vpc_id              = module.security_vpc.vpc_id
  main_route_table_id = module.security_vpc.vpc_main_route_table_id
  public_subnet_ids   = module.security_vpc.public_subnets
}


module "frontend_vpc_infra" {
  source = "./frontend_vpc"

  env    = var.env
  vpc_id = module.frontend_vpc.vpc_id
  ALB_AZ1 = module.frontend_vpc.azs[0]
  ALB_AZ2 = module.frontend_vpc.azs[1]
}



