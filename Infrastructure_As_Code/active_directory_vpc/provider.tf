terraform {
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
