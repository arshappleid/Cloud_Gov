// FrontEnd VPC - 2 Private Subnets
module "frontend_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  // Networking Settings
  name                 = "Frontend-VPC"
  cidr                 = cidrsubnet(main_cidr, 8, 2) // Increment New Bit value by 1 , for each vpc , NewBit Value = 1 => 10.1.0.0/16
  enable_nat_gateway   = false                       // Provisioned with an Elastic IP
  enable_vpn_gateway   = false
  enable_dns_hostnames = false // Not assign any dns hostnames
  azs                  = local.azs

  // Subnets
  private_subnets = [for key, value in locals.azs : cidrsubnet(module.frontend_vpc.cidr, 8, key)] // 10.2.1.0/24 , 10.2.2.0/24

  // Logging
  enable_flow_log                                 = true
  flow_log_destination_type                       = "s3"
  flow_log_destination_arn                        = module.vpc_flow_logs_bucket.s3_bucket_arn
  flow_log_cloudwatch_log_group_name_prefix       = "/aws/frontend-vpc-logz/"
  flow_log_cloudwatch_log_group_name_suffix       = var.env
  flow_log_cloudwatch_log_group_retention_in_days = 31
  flow_log_file_format                            = "plain-text"
}