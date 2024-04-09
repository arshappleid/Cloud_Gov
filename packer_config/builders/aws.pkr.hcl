source "amazon-ebs" "ubuntu" {
  // AWS Credentials explicityly referenced from ENV variables
  ami_name      = "packer-ubuntu-22-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-west-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs" // block store, to keep data persistent
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    "Environment" = var.env
    "Created-by"  = "Packer"
  }
}