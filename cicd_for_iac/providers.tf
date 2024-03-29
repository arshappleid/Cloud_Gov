terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.33.0" // Specify your desired version
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  alias  = "replication"
  region = "us-east-2"
}
