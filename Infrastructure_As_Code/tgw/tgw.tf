resource "aws_ec2_transit_gateway" "Main_Transity_Gateway" {
  description = "TGW for Cloud Gov Organization"
  tags = {
    Name = "Cloud_Gov_TG"
  }
}