locals {
  tags = {
    "env"          = "dev"
    "project_name" = "My Test Project"
  }
}
module "kms_keys" {
  source = "./kms_keys"
}
module "iam_roles" {
  source = "./iam"

  log_bucket_kms_key_arn = module.kms_keys.log_bucket_kms_key_arn

}

module "dns_route53" {
  source            = "./dns-resolver"
  prod_route_record = module.cloudfront.recieving_endpoint
  tags              = local.tags
}
module "waf" {
  source = "./waf"

  enable_logging = false
  tags           = local.tags
}

module "cloudfront" {
  source = "./cloudfront"

  destination_id               = "Resource-id-of-the-recieve-traffic-unit"
  logging_bucket_regional_name = module.cloudfront_logs.bucket_bucket_domain_name
  tags                         = local.tags
}
// VPC modules are seperate, to avoid making changes to them on individual terraform apply
module "security_vpc_infra" {
  source = "./security_vpc"

  env                 = var.env
  vpc_id              = module.security_vpc.vpc_id
  main_route_table_id = module.security_vpc.vpc_main_route_table_id
  public_subnet_ids   = module.security_vpc.public_subnets
  tags                = local.tags

  // This VPC is expected to route traffic to multiple applications
  app_1_frontend_alb_id = module.frontend_vpc_infra.ALB_Id
}


module "frontend_vpc_infra" {
  source = "./frontend_vpc"

  env     = var.env
  vpc_id  = module.frontend_vpc.vpc_id
  ALB_AZ1 = module.frontend_vpc.azs[0]
  ALB_AZ2 = module.frontend_vpc.azs[1]
}



