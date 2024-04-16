module "tgw" {
  source = "./tgw/tgw"
  env    = "dev"
}

module "security_vpc" {
  source = "./security_vpc"

  env                     = "dev"
  tgw_id                  = module.tgw.id
  vpc_cidr_block          = "10.1.0.0/16"
  FrontEnd_VPC_CIDR_block = "10.2.0.0/16"
}


module "frontend_vpc" {
  source = "./frontend_vpc"

  env               = "dev"
  tgw_id            = module.tgw.id
  vpc_cidr_block    = "10.2.0.0/16"
  ALB_AZ1           = "us-east-1a"
  ALB_AZ2           = "us-east-1b"
  Securtiy_VPC_CIDR = module.security_vpc.VPC_CIDR_Block
}

module "tgw_attachment" {
  source = "./tgw/attachments"
  tgw_id = module.tgw.id
  attachments = [
    {
      vpc_id                  = module.security_vpc.vpc_id
      vpc_main_route_table_id = module.security_vpc.main_route_table_id
      subnet_ids              = module.security_vpc.subnet_ids   // All these subnets will be able to reach TGW Attachment
      destinations            = [module.frontend_vpc.cidr_block] // Traffic for all these Destination CIDR, will be sent to TGW-Attach
    },
    {
      vpc_id                  = module.frontend_vpc.vpc_id
      vpc_main_route_table_id = module.frontend_vpc.main_route_table_id
      subnet_ids              = module.frontend_vpc.subnet_ids
      destinations            = ["0.0.0.0/0", module.security_vpc.cidr_block]
    }
  ]
}


