deployment "development" {
  variables = {
    aws_regions             = ["us-east-1"]
    azure_regions           = ["northcentralus"]
    default_tags      = { 
      env = "dev"
     }
  }
}

deployment "production" {
  variables = {
    aws_regions             = ["us-east-1", "us-west-1"]
    azure_regions           = ["northcentralus","westus"]
    default_tags      = { 
      env = "prod"
     }
  }
}