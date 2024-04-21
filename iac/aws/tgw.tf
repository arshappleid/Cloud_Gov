module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  name        = "CloudGov-TGW"
  description = "My TGW shared with several other AWS accounts"

  enable_auto_accept_shared_attachments = false
  enable_dns_support                    = true

  vpc_attachments = {
    security_vpc = {
      vpc_id       = module.security_vpc.vpc_id
      subnet_ids   = module.security_vpc.private_subnets
      dns_support  = true
      ipv6_support = true
      tgw_routes = [
        {
          destination_cidr_block = "0.0.0.0/0" // Route all internet traffic through Security VPC
        },
        {
          destination_cidr_block = module.security_vpc.vpc_cidr_block
        }
      ]
    },
    frontend_vpc = {
      vpc_id       = module.frontend_vpc.id
      subnet_ids   = module.frontend_vpc.private_subnets
      dns_support  = true
      ipv6_support = true
      tgw_routes = [
        {
          destination_cidr_block = module.frontend_vpc.vpc_cidr_block
        }
      ]
    }
  }

  tags = {
    Purpose = "CloudGov-TGW"
  }
}
