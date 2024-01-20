variable "test" {
  default     = false
  type        = bool
  description = "Use this to initialize the test environment"
}

variable "Tester_PC_IP"{
  description = "Your PC's IP address for SSH access"
  type        = string
}
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}