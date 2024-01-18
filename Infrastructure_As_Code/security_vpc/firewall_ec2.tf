// Will fetch the latest ami id , for amazon ami image
data "aws_ami" "latest_ami" {
  most_recent = true

  owners = ["amazon"] // Amazon ami

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] // AMI pattern
  }
}

resource "aws_instance" "example_instance" {
  ami             = data.aws_ami.latest_ami.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.security_vpc_public_subnet.id
  security_groups = [aws_security_group.allow_connection_from_everywhere_sg.name]

  tags = {
    Name = "firewall-instance"
  }
}