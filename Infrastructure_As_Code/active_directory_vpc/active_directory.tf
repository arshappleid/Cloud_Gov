resource "aws_directory_service_directory" "cloud_gov_ad" {
  name     = "ad.cloudgov.com"
  password = "P@assword"
  edition  = "Standard"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = aws_vpc.active_directory_vpc.id
    subnet_ids = ["${aws_subnet.ad_subnet_1.id}", "${aws_subnet.ad_subnet_2.id}"]
  }

  tags = {
    Project = "Cloud Gov AD"
  }

  description = "Microsoft AD Setup , to manage authentication access all the cloud resources for Cloud Gov"
}