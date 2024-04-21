// Used in firewall_ec2.tf file
variable "firewall_instance_ami_id"{
	type = string
	default = "ami-04c0f9ef2f505b609" // default amazon ami id
}
variable "firewall_ec2_instance_type"{
	type = string
	description = "Ec2 instance size , for firewall instance"
	default = "t2.micro"
}

variable "ec2_vpc_Id"{
  description = "VPC ID in which the ec2 will be deployed."
}

variable "ec2_subnets_Ids"{
  description = "Subnet ID in which the ec2 will be deployed."
}