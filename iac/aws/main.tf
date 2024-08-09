locals {
  tags = {
    "Project-Name" = "My Test Project"
  }
}
module "waf" {
  source = "./waf"

  enable_logging = false
  tags           = local.tags
}

module "cloudfront" {
  source = "./cloudfront"

  destination_id = "Resource-id-of-the-recieve-traffic-unit"
  tags           = local.tags
}

module "security_vpc_infra" {
  source = "./security_vpc"

  env                 = var.env
  vpc_id              = module.security_vpc.vpc_id
  main_route_table_id = module.security_vpc.vpc_main_route_table_id
  public_subnet_ids   = module.security_vpc.public_subnets
}


module "frontend_vpc_infra" {
  source = "./frontend_vpc"

  env     = var.env
  vpc_id  = module.frontend_vpc.vpc_id
  ALB_AZ1 = module.frontend_vpc.azs[0]
  ALB_AZ2 = module.frontend_vpc.azs[1]
}

module "guardduty" {
  source = "./guardduty"

  enable_s3_logs                = true
  ebs_volume_malware_protection = true
}
module "security_hub" {
  source = "./securityhub"
}

module "sns_alerts" {
  source                   = "./sns_alerts"
  guardduty_alert_emails   = ["notify_this_email@gmail.com"]
  securityhub_alert_emails = ["notify_this_email@gmail.com"] // SOAR
}


