variable "firewall_ec2_instance_type"{
	type = string
	description = "Ec2 instance size , for firewall instance"
	default = "t2.micro"
}
// Used in firewall_ec2.tf file
variable "firewall_instance_ami_id"{
	type = string
	default = "ami-04c0f9ef2f505b609" // default amazon ami id
}
// Will fetch the latest ami id , for amazon ami image
data "aws_ami" "latest_ami" {
  most_recent = true

  owners = ["amazon"] // Amazon ami

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] // AMI pattern
  }
}