data "aws_availability_zones" "available" {}

locals {
  azs            = slice(data.aws_availability_zones.available.names, 0, 3) // First 2 AZs from List of AZs
  main_cidr      = "10.0.0.0/8"
  s3_bucket_name = "vpc-flow-logs-to-s3-${random_pet.this.id}"
}

// Security VPC
module "security_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  // Networking Settings
  name                 = "Security-VPC"
  cidr                 = cidrsubnet(main_cidr, 8, 1) // Increment New Bit value by 1 , for each vpc , NewBit Value = 1 => 10.1.0.0/16
  enable_nat_gateway   = true                        // Provisioned with an Elastic IP
  enable_vpn_gateway   = false
  enable_dns_hostnames = false // Not assign any dns hostnames
  azs                  = local.azs

  // Subnets
  private_subnets = [for key, value in locals.azs : cidrsubnet(module.security_vpc.cidr, 8, key)] // 10.1.1.0/24 , 10.1.2.0/24

  // Logging
  enable_flow_log                                 = true
  flow_log_destination_type                       = "s3"
  flow_log_destination_arn                        = module.vpc_flow_logs_bucket.s3_bucket_arn
  flow_log_cloudwatch_log_group_name_prefix       = "/aws/security-vpc-logz/"
  flow_log_cloudwatch_log_group_name_suffix       = var.env
  flow_log_cloudwatch_log_group_retention_in_days = 31
  flow_log_file_format                            = "plain-text"
}




