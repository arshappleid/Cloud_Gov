resource "aws_vpc" "frontend_vpc" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "FrontEnd_App_Vpc"
  }
}