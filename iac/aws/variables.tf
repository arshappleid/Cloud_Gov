variable "env" {
  default     = "dev"
  description = "Environment Type : dev , test , stag"
}
data "aws_availability_zones" "available" {} // Will look for AZs in the region

locals {
  azs            = slice(data.aws_availability_zones.available.names, 0, 3) // First 2 AZs from List of AZs
  main_cidr      = "10.0.0.0/8"
  s3_bucket_name = "vpc-flow-logs-to-s3-${random_pet.this.id}"
}
variable "tags" {
  type = map(string)
  default = {
    env          = "dev"
    project_name = "my-demo-project"
  }
}
